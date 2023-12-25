import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/constants/firebase_constants.dart';
import 'package:kman/core/faliure.dart';
import 'package:kman/core/providers/firebase_providers.dart';
import 'package:kman/core/type_def.dart';
import 'package:kman/models/grounds_model.dart';
import 'package:kman/models/reserved_model.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../theme/pallete.dart';

final PlayRepositoryProvider =
    Provider((ref) => PlayRepository(firestore: ref.watch(FirestoreProvider)));

class PlayRepository {
  final FirebaseFirestore _firestore;

  PlayRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
  CollectionReference get _reserve =>
      _firestore.collection(FirebaseConstants.reserveCollection);

  FutureVoid reserve(String groundId, String collection,
      ReserveModel reserveModel, String uid, int points) async {
    try {
      right(_reserve.doc(reserveModel.id).set(reserveModel.toMap()));
      _users.doc(uid).update({"points": points});

      return right(_firestore
          .collection(collection)
          .doc(groundId)
          .collection("reserve")
          .doc(reserveModel.id)
          .update({"isresrved": true, "userId": uid}));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid gpsTracking(
    double long,
    double lat,
  ) async {
    try {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();

      if (statuses[Permission.location]!.isGranted) {
        String url =
            "https://www.google.com/maps/search/?api=1&query=$lat,$long";
        return right(launch(
          url,
          customTabsOption: CustomTabsOption(
            toolbarColor: Pallete.primaryColor,
            enableDefaultShare: true,
            enableUrlBarHiding: true,
            showPageTitle: true,
            animation: CustomTabsSystemAnimation.slideIn(),
            extraCustomTabs: const <String>[
              // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
              'org.mozilla.firefox',
              // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
              'com.microsoft.emmx',
            ],
          ),
          safariVCOption: SafariViewControllerOption(
            preferredBarTintColor: Pallete.primaryColor,
            preferredControlTintColor: Pallete.whiteColor,
            barCollapsingEnabled: true,
            entersReaderIfAvailable: false,
            dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
          ),
        ));
      } else {
        throw "Dont have permission";
      }
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      return left(Failure(e.toString()));
    }
  }

  FutureVoid joinGame(String collection, String groundId, String reserveId,
      String userId, int points) async {
    try {
      _reserve.doc(reserveId).update({
        'collaborations': FieldValue.arrayUnion([userId]),
      });
      _users.doc(userId).update({"points": points});
      return right(_firestore
          .collection(collection)
          .doc(groundId)
          .collection("reserve")
          .doc(reserveId)
          .update({
        'collaborations': FieldValue.arrayUnion([userId]),
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid leaveGame(String collection, String groundId, String reserveId,
      String userId, int points) async {
    try {
      _reserve.doc(reserveId).update({
        'collaborations': FieldValue.arrayRemove([userId]),
      });
      _users.doc(userId).update({"points": points});

      return right(_firestore
          .collection(collection)
          .doc(groundId)
          .collection("reserve")
          .doc(reserveId)
          .update({
        'collaborations': FieldValue.arrayRemove([userId]),
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid askForPlayes(String groundId, String collection,
      ReserveModel reserveModel, int targetplayesNum) async {
    try {
      await _firestore
          .collection(collection)
          .doc(groundId)
          .collection("reserve")
          .doc(reserveModel.id)
          .update({"iscomplete": false, "targetplayesNum": targetplayesNum});

      return right(_users
          .doc("uid")
          .collection("reserve")
          .doc(reserveModel.id)
          .update({"iscomplete": false, "targetplayesNum": targetplayesNum}));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<GroundModel>> getGrounds(String collection) {
    return _firestore.collection(collection).snapshots().map((event) {
      List<GroundModel> grounds = [];
      for (var document in event.docs) {
        grounds
            .add(GroundModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return grounds;
    });
  }

  Stream<List<ReserveModel>> getReservisions(
      String collection, String groundId, String day) {
    return _firestore
        .collection(collection)
        .doc(groundId)
        .collection("reserve")
        .where("day", isEqualTo: day)
        .where("isresrved", isNotEqualTo: true)
        .snapshots()
        .map((event) {
      List<ReserveModel> grounds = [];
      for (var document in event.docs) {
        grounds
            .add(ReserveModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return grounds;
    });
  }

  Future<List<ReserveModel>> getUserreserve(String uid) {
    return _firestore
        .collection("reserve")
        .where("userId", isEqualTo: uid)
        .get()
        .then((event) {
      List<ReserveModel> grounds = [];
      for (var document in event.docs) {
        grounds
            .add(ReserveModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return grounds;
    });
  }
//*******************payment   **************** */

  //*************** Search *******************

  Stream<List<GroundModel>> searchFootballGrounds(String query) {
    return _firestore
        .collection("football")
        .where(
          'name',
          isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
          isLessThan: query.isEmpty
              ? null
              : query.substring(0, query.length - 1) +
                  String.fromCharCode(
                    query.codeUnitAt(query.length - 1) + 1,
                  ),
        )
        .snapshots()
        .map((event) {
      List<GroundModel> grounds = [];
      for (var community in event.docs) {
        grounds.add(GroundModel.fromMap(community.data()));
      }
      return grounds;
    });
  }

  Stream<List<GroundModel>> searchBasketBallGrounds(String query) {
    return _firestore
        .collection("basketball")
        .where(
          'name',
          isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
          isLessThan: query.isEmpty
              ? null
              : query.substring(0, query.length - 1) +
                  String.fromCharCode(
                    query.codeUnitAt(query.length - 1) + 1,
                  ),
        )
        .snapshots()
        .map((event) {
      List<GroundModel> grounds = [];
      for (var community in event.docs) {
        grounds.add(GroundModel.fromMap(community.data()));
      }
      return grounds;
    });
  }

  Stream<List<GroundModel>> searchPadelGrounds(String query) {
    return _firestore
        .collection("padel")
        .where(
          'name',
          isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
          isLessThan: query.isEmpty
              ? null
              : query.substring(0, query.length - 1) +
                  String.fromCharCode(
                    query.codeUnitAt(query.length - 1) + 1,
                  ),
        )
        .snapshots()
        .map((event) {
      List<GroundModel> grounds = [];
      for (var community in event.docs) {
        grounds.add(GroundModel.fromMap(community.data()));
      }
      return grounds;
    });
  }

  Stream<List<GroundModel>> searchVolleyBallGrounds(String query) {
    return _firestore
        .collection("Volleyball")
        .where(
          'name',
          isGreaterThanOrEqualTo: query.isEmpty ? 0 : query,
          isLessThan: query.isEmpty
              ? null
              : query.substring(0, query.length - 1) +
                  String.fromCharCode(
                    query.codeUnitAt(query.length - 1) + 1,
                  ),
        )
        .snapshots()
        .map((event) {
      List<GroundModel> grounds = [];
      for (var community in event.docs) {
        grounds.add(GroundModel.fromMap(community.data()));
      }
      return grounds;
    });
  }

  //***************futures only for groun owner*******************
  FutureVoid setGround(GroundModel groundModel, String collection) async {
    try {
      return right(_firestore
          .collection(collection)
          .doc(groundModel.id)
          .set(groundModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid setreservision(
      String groundId, String collection, ReserveModel reserveModel) async {
    try {
      _reserve..doc(reserveModel.id).set(reserveModel.toMap());

      return right(_firestore
          .collection(collection)
          .doc(groundId)
          .collection("reserve")
          .doc(reserveModel.id)
          .set(reserveModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
