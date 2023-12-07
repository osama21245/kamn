import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/constants/firebase_constants.dart';
import 'package:kman/core/faliure.dart';
import 'package:kman/core/providers/firebase_providers.dart';
import 'package:kman/core/type_def.dart';
import 'package:kman/models/grounds_model.dart';
import 'package:kman/models/reserved_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

final PlayRepositoryProvider =
    Provider((ref) => PlayRepository(firestore: ref.watch(FirestoreProvider)));

class PlayRepository {
  final FirebaseFirestore _firestore;

  PlayRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  FutureVoid reserve(
      String groundId, String collection, ReserveModel reserveModel) async {
    try {
      await _firestore
          .collection(collection)
          .doc(groundId)
          .collection("reserve")
          .doc(reserveModel.id)
          .update({"isresrved": true});

      return right(_users
          .doc("uid")
          .collection("reserve")
          .doc(reserveModel.id)
          .set(reserveModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid gpsTracking(double long, double lat) async {
    try {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      if (statuses[Permission.location]!.isGranted) {
        String url =
            "https://www.google.com/maps/search/?api=1&query=$lat,$long";
        if (await canLaunchUrl(Uri.parse(url))) {
          return right(launchUrl(Uri.parse(url)));
        } else {
          throw "Could not open the map";
        }
      } else {
        throw "Dont have permission";
      }
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid joinGame(String collection, String groundId, String reserveId,
      String userId) async {
    try {
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
      String userId) async {
    try {
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

  Stream<List<ReserveModel>> getuserGrounds(String userId) {
    return _users.doc(userId).collection("reserve").snapshots().map((event) {
      List<ReserveModel> reservisions = [];
      for (var document in event.docs) {
        reservisions
            .add(ReserveModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return reservisions;
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
