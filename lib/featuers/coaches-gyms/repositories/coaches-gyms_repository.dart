import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/faliure.dart';
import 'package:kman/core/providers/firebase_providers.dart';
import 'package:kman/core/type_def.dart';
import 'package:kman/models/coache_model.dart';
import 'package:kman/models/gym_model.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:kman/theme/pallete.dart';

final CoachesGymsRepositoryProvider = Provider(
    (ref) => CoachesGymsRepository(firestore: ref.watch(FirestoreProvider)));

class CoachesGymsRepository {
  final FirebaseFirestore _firestore;

  CoachesGymsRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  CollectionReference get _coaches => _firestore.collection("coaches");
  CollectionReference get _gyms => _firestore.collection("gyms");

  Future<List<CoacheModel>> getCoaches() {
    return _coaches.get().then((value) {
      List<CoacheModel> coaches = [];
      for (var document in value.docs) {
        coaches
            .add(CoacheModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return coaches;
    });
  }

  FutureVoid openWhatsApp(String phone) async {
    final whatsappUrl = 'https://wa.me/+20$phone';
    try {
      return right(launch(
        whatsappUrl,
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
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      return left(Failure(e.toString()));
    }
  }

  FutureVoid activeCoach(String userId, String coachid) async {
    try {
      return right(_coaches.doc(coachid).update({"userId": userId}));
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid activeGym(String userId, String gymid) async {
    try {
      return right(_gyms.doc(gymid).update({"userId": userId}));
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid openFacebookLink(String link) async {
    final String facebookLink = "https://www.facebook.com/$link";

    try {
      return right(launch(
        facebookLink,
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
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      return left(Failure(e.toString()));
    }
  }

  Future<List<GymModel>> getGyms() {
    return _gyms.get().then((value) {
      List<GymModel> gyms = [];
      for (var document in value.docs) {
        gyms.add(GymModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return gyms;
    });
  }

  //futures only for groun owner
  FutureVoid setGym(GymModel gymModel) async {
    try {
      return right(_gyms.doc(gymModel.id).set(gymModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid setCoache(CoacheModel coacheModel) async {
    try {
      return right(_coaches.doc(coacheModel.id).set(coacheModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
