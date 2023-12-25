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
import 'package:kman/models/medical_model.dart';
import 'package:kman/models/nutrition_model.dart';
import 'package:kman/models/sports_model.dart';
import 'package:kman/theme/pallete.dart';

final BenefitsRepositoryProvider = Provider(
    (ref) => BenefitsRepository(firestore: ref.watch(FirestoreProvider)));

class BenefitsRepository {
  final FirebaseFirestore _firestore;

  BenefitsRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  CollectionReference get _medical => _firestore.collection("medical");
  CollectionReference get _nutrition => _firestore.collection("nutrition");
  CollectionReference get _sports => _firestore.collection("sports");

  Future<List<MedicalModel>> getMedicals() {
    return _medical.get().then((value) {
      List<MedicalModel> medicals = [];
      for (var document in value.docs) {
        medicals
            .add(MedicalModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return medicals;
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

  // FutureVoid openFacebookLink(String link) async {
  //   try {
  //     final String facebookLink = "https://www.facebook.com/$link";

  //     // Check if the URL can be launched
  //     if (await canLaunchUrl(Uri.parse(facebookLink))) {
  //       // Launch the URL
  //       return right(launchUrl(Uri.parse(facebookLink)));
  //     } else {
  //       // Handle the case where the URL can't be launched
  //       throw "Could not launch FaceBook";
  //     }
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }

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

  FutureVoid activeMedical(String userId, String medicalid) async {
    try {
      return right(_medical.doc(medicalid).update({"userId": userId}));
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid activeNutrition(String userId, String nutritionid) async {
    try {
      return right(_nutrition.doc(nutritionid).update({"userId": userId}));
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<List<NutritionModel>> getNurition() {
    return _nutrition.get().then((value) {
      List<NutritionModel> nutritions = [];
      for (var document in value.docs) {
        nutritions.add(
            NutritionModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return nutritions;
    });
  }

  Future<List<SportsModel>> getSports() {
    return _sports.get().then((value) {
      List<SportsModel> sports = [];
      for (var document in value.docs) {
        sports
            .add(SportsModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return sports;
    });
  }

  //futures only for groun owner
  FutureVoid setMedical(MedicalModel medicalModel) async {
    try {
      return right(_medical.doc(medicalModel.id).set(medicalModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid setNutrition(NutritionModel nutritionModel) async {
    try {
      return right(
          _nutrition.doc(nutritionModel.id).set(nutritionModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid setSports(SportsModel sportsModel) async {
    try {
      return right(_sports.doc(sportsModel.id).set(sportsModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
