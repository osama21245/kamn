import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';
import 'package:kman/models/coache_model.dart';
import 'package:kman/models/gym_model.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/providers/storage_repository.dart';
import '../../../core/providers/utils.dart';
import '../repositories/coaches-gyms_repository.dart';

final getCoachesProvider = FutureProvider(
    (ref) => ref.watch(coachesGymsControllerProvider.notifier).getCoaches());

final getGymsProvider = FutureProvider(
    (ref) => ref.watch(coachesGymsControllerProvider.notifier).getGyms());

final coachesGymsControllerProvider =
    StateNotifierProvider<CoachesGymsController, StatusRequest>((ref) =>
        CoachesGymsController(
            storageRepository: ref.watch(storageRepositoryProvider),
            coachesGymsRepository: ref.watch(CoachesGymsRepositoryProvider),
            ref: ref));

class CoachesGymsController extends StateNotifier<StatusRequest> {
  final Ref _ref;
  final CoachesGymsRepository _coachesGymsRepository;
  final StorageRepository _storageRepository;

  CoachesGymsController(
      {required CoachesGymsRepository coachesGymsRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _coachesGymsRepository = coachesGymsRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(StatusRequest.success);

  Future<List<CoacheModel>> getCoaches() {
    return _coachesGymsRepository.getCoaches();
  }

  Future<List<GymModel>> getGyms() {
    return _coachesGymsRepository.getGyms();
  }

  void openWhatsApp(String phone, BuildContext context) async {
    final res = await _coachesGymsRepository.openWhatsApp(phone);
    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }

  //**************************futuers only for ground owner*******************************************

  void setGyms(
    BuildContext context,
  ) async {
    String id = Uuid().v1();
    final owneruserid = _ref.watch(usersProvider)!.uid;
    String address;
    Position position;
    String logo = "";
    // get user loction
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    address = "${placemark.administrativeArea}, ${placemark.country}";

    //get image

    // final res = await _storageRepository.storeFile(
    //     path: "Gyms", id: id, file: fileLogo);

    // res.fold((l) => showSnackBar(l.toString(), context), (r) {
    //   logo = r;
    // });
//set data
    if (logo == "") {
      GymModel gymModel = GymModel(
          rating: 4.5,
          benefitsFirstPlan:
              "1- You will have 30 Sessions Mounthly\n2- 5 Sessions sauna\n3- 5 Sessions jacuzzi\n4- 1 invitation\n1- You will have 50 Sessions Mounthly\n2- 3 Sessions sauna\n3- 3 Sessions jacuzzi\n4- 2 invitation\n1- You will have 30 Sessions Mounthly\n2- 5 Sessions sauna\n3- 5 Sessions jacuzzi\n4- 3 invitation",
          benefitsSecoundPlan:
              "1- You will have 30 Sessions Mounthly\n2- 5 Sessions sauna\n3- 5 Sessions jacuzzi\n4- 1 invitation\n1- You will have 50 Sessions Mounthly\n2- 3 Sessions sauna\n3- 3 Sessions jacuzzi\n4- 2 invitation\n1- You will have 30 Sessions Mounthly\n2- 5 Sessions sauna\n3- 5 Sessions jacuzzi\n4- 90 invitation",
          id: id,
          owneruserId: owneruserid,
          name: "GOLD'S GYM",
          link: "https://www.facebook.com/GoldsGymEgypt?mibextid=LQQJ4d",
          logo: "logo",
          address: address,
          long: position.longitude,
          lat: position.latitude,
          ismix: true,
          price: 400);

      final res = await _coachesGymsRepository.setGym(gymModel);
      res.fold((l) => showSnackBar(l.toString(), context),
          (r) => showSnackBar("Your Gym Added Succefuly", context));
    }
  }

  void setCoache(
      String name,
      BuildContext context,
      String education,
      String whatsAppNum,
      String categoriry,
      String experience,
      File fileCoacheImage,
      int price,
      List<String> cvs,
      String benefits) async {
    String id = Uuid().v1();
    String photo = "";
    //get image

    final res = await _storageRepository.storeFile(
        path: "Gyms", id: id, file: fileCoacheImage);

    res.fold((l) => showSnackBar(l.toString(), context), (r) {
      photo = r;
    });

    if (photo != "") {
      CoacheModel coacheModel = CoacheModel(
          id: id,
          name: name,
          raTing: 4.5,
          userId: "",
          photo: photo,
          education: education,
          whatsAppNum: whatsAppNum,
          categoriry: categoriry,
          experience: experience,
          price: price,
          benefits: benefits,
          cvs: cvs);

      final res = await _coachesGymsRepository.setCoache(coacheModel);
      res.fold((l) => showSnackBar(l.toString(), context),
          (r) => showSnackBar("Your reserve Added Succefuly", context));
    }
  }
}
