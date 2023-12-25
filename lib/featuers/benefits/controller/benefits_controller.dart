import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';
import 'package:kman/homemain.dart';
import 'package:kman/models/coache_model.dart';
import 'package:kman/models/gym_model.dart';
import 'package:kman/models/medical_model.dart';
import 'package:kman/models/nutrition_model.dart';
import 'package:kman/models/sports_model.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/providers/storage_repository.dart';
import '../../../core/providers/utils.dart';
import '../repositories/benefits_repository.dart';

final getMedicalProvider = FutureProvider(
    (ref) => ref.watch(benefitsControllerProvider.notifier).getMedical());

final getNutritionProvider = FutureProvider(
    (ref) => ref.watch(benefitsControllerProvider.notifier).getNutrition());

final getSportsProvider = FutureProvider(
    (ref) => ref.watch(benefitsControllerProvider.notifier).getSports());

final benefitsControllerProvider =
    StateNotifierProvider<BenefitsController, StatusRequest>((ref) =>
        BenefitsController(
            storageRepository: ref.watch(storageRepositoryProvider),
            benefitsRepository: ref.watch(BenefitsRepositoryProvider),
            ref: ref));

class BenefitsController extends StateNotifier<StatusRequest> {
  final Ref _ref;
  final BenefitsRepository _benefitsRepository;
  final StorageRepository _storageRepository;

  BenefitsController(
      {required BenefitsRepository benefitsRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _benefitsRepository = benefitsRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(StatusRequest.success);

  Future<List<MedicalModel>> getMedical() {
    return _benefitsRepository.getMedicals();
  }

  Future<List<NutritionModel>> getNutrition() {
    return _benefitsRepository.getNurition();
  }

  Future<List<SportsModel>> getSports() {
    return _benefitsRepository.getSports();
  }

  void openWhatsApp(String phone, BuildContext context) async {
    final res = await _benefitsRepository.openWhatsApp(phone);
    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }

  void openFaceBookLink(String link, BuildContext context) async {
    final res = await _benefitsRepository.openFacebookLink(link);
    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }

  void activeMedical(
      String medicalid, String userId, BuildContext context) async {
    state = StatusRequest.loading;
    final res = await _benefitsRepository.activeMedical(userId, medicalid);
    state = StatusRequest.success;

    res.fold((l) => showSnackBar(l.message, context), (r) {
      Get.to(() => HomeMain());
    });
  }

  void activeNutrition(
      String nutritionid, String userId, BuildContext context) async {
    state = StatusRequest.loading;
    final res = await _benefitsRepository.activeNutrition(userId, nutritionid);
    state = StatusRequest.success;
    res.fold((l) => showSnackBar(l.message, context), (r) {
      Get.to(() => HomeMain());
    });
  }

  //**************************futuers only for ground owner*******************************************

  void setMedical(
      BuildContext context,
      File filelogo,
      int price,
      String name,
      String experience,
      String benefits,
      String specialization,
      String education,
      int discount,
      String whatsAppNumber) async {
    state = StatusRequest.loading;

    String id = Uuid().v1();

    String logo = "";

    //get image

    final res = await _storageRepository.storeFile(
        path: "Medical", id: id, file: filelogo);

    res.fold((l) => showSnackBar(l.toString(), context), (r) {
      logo = r;
    });
//set data
    if (logo != "") {
      MedicalModel gymModel = MedicalModel(
          price: price,
          id: id,
          userId: "",
          image: logo,
          name: name,
          raTing: 0,
          education: education,
          specialization: specialization,
          experience: experience,
          benefits: benefits,
          whatAppNum: whatsAppNumber,
          discount: discount);

      final res = await _benefitsRepository.setMedical(gymModel);
      state = StatusRequest.success;
      res.fold((l) => showSnackBar(l.toString(), context), (r) {
        showSnackBar("Your Medical Added Succefuly", context);
        Get.to(() => HomeMain());
      });
    }
  }

  void setNutrition(
      BuildContext context,
      File fileNutrtionImage,
      String name,
      String experience,
      String benefits,
      String specialization,
      String education,
      int discount,
      String whatsAppNumber,
      int price) async {
    state = StatusRequest.loading;

    String id = Uuid().v1();

    String photo = "";
    //get image

    final res = await _storageRepository.storeFile(
        path: "Nutrition", id: id, file: fileNutrtionImage);

    res.fold((l) => showSnackBar(l.toString(), context), (r) {
      photo = r;
    });

    if (photo != "") {
      NutritionModel coacheModel = NutritionModel(
          price: price,
          id: id,
          whatsAppNum: whatsAppNumber,
          image: photo,
          userId: "",
          name: name,
          raTing: 0,
          education: education,
          specialization: specialization,
          experience: experience,
          benefits: benefits,
          discount: discount);
      state = StatusRequest.success;

      final res = await _benefitsRepository.setNutrition(coacheModel);
      res.fold((l) => showSnackBar(l.toString(), context), (r) {
        Get.to(() => HomeMain());
        showSnackBar("Your nutrition Added Succefuly", context);
      });
    }
  }

  void setSports(
    BuildContext context,
    File fileSportsImage,
    String name,
    String about,
    String link,
    int discount,
  ) async {
    state = StatusRequest.loading;
    String id = Uuid().v1();
    final userId = _ref.watch(usersProvider)!.uid;

    String photo = "";
    // get image

    final res = await _storageRepository.storeFile(
        path: "Gyms", id: id, file: fileSportsImage);

    res.fold((l) => showSnackBar(l.toString(), context), (r) {
      photo = r;
    });

    if (photo == "") {
      SportsModel coacheModel = SportsModel(
          id: id,
          name: name,
          image: photo,
          discount: discount,
          rating: 0,
          about: about,
          storelink: link);
      state = StatusRequest.success;

      final res = await _benefitsRepository.setSports(coacheModel);
      res.fold((l) => showSnackBar(l.toString(), context),
          (r) => showSnackBar("Your sport Added Succefuly", context));
    }
  }
}
