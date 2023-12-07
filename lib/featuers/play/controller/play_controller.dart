import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kman/core/class/reservisionParameters.dart';
import 'package:kman/core/class/searchParameters.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/core/providers/checkInternet.dart';
import 'package:kman/homemain.dart';
import 'package:kman/models/reserved_model.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/play/repositories/play_repository.dart';
import 'package:kman/models/grounds_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/providers/storage_repository.dart';
import '../../../core/providers/utils.dart';
import '../screens/animated_reservision_screen.dart';

final getGroundsProvider = StreamProvider.family((ref, String collection) =>
    ref.watch(playControllerProvider.notifier).getGrounds(collection));

final getSearchGrounds = StreamProvider.family((ref, String query) =>
    ref.watch(playControllerProvider.notifier).searchGrounds(query));

final getUserGroundsProvider = StreamProvider(
    (ref) => ref.watch(playControllerProvider.notifier).getuserGrounds());

final getreservisionsProvider = StreamProvider.family((
  ref,
  ReservationsParams reservationsParams,
) {
  final playController = ref.watch(playControllerProvider.notifier);
  // Use ref.read to manually manage the subscription and disposal
  final streamController = StreamController<List<ReserveModel>>();
  final subscription =
      playController.getReservisions(reservationsParams).listen(
            (data) => streamController.add(data),
            onError: (error) => streamController.addError(error),
          );

  // Dispose the subscription when the stream is no longer needed
  ref.onDispose(() {
    subscription.cancel();
    streamController.close();
  });
  return streamController.stream;
});

final playControllerProvider =
    StateNotifierProvider<playController, StatusRequest>((ref) =>
        playController(
            storageRepository: ref.watch(storageRepositoryProvider),
            playRepository: ref.watch(PlayRepositoryProvider),
            ref: ref));

class playController extends StateNotifier<StatusRequest> {
  final Ref _ref;
  final PlayRepository _playRepository;
  final StorageRepository _storageRepository;

  playController(
      {required PlayRepository playRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _playRepository = playRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(StatusRequest.success);

  void reserve(String groundId, BuildContext context, String collection,
      ReserveModel reserveModel) async {
    state = StatusRequest.loading;
    final res =
        await _playRepository.reserve(groundId, collection, reserveModel);
    state = StatusRequest.success;
    res.fold((l) => showSnackBar(l.toString(), context), (r) {
      Get.to(AnimatedReservisionScreen());
      showSnackBar("Your reserve Added Succefuly", context);
    });
  }

  void gpsTracking(double long, double lat, BuildContext context) async {
    state = StatusRequest.loading;
    final res = await _playRepository.gpsTracking(long, lat);
    state = StatusRequest.success;
    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }

  void askForPlayers(String groundId, BuildContext context, String collection,
      ReserveModel reserveModel, int targetplayesNum) async {
    state = StatusRequest.loading;
    String id = Uuid().v1();
    final res = await _playRepository.askForPlayes(
        groundId, collection, reserveModel, targetplayesNum);
    state = StatusRequest.success;
    res.fold((l) => showSnackBar(l.toString(), context),
        (r) => showSnackBar("Your reserve Added Succefuly", context));
  }

  void joinGame(String collection, String groundId, String reserveId,
      BuildContext context) async {
    final userId = "osama";
    final res =
        await _playRepository.joinGame(collection, groundId, reserveId, userId);
    res.fold((l) => showSnackBar(l.message, context), (r) {
      //  Get.to(HomeMain());
      showSnackBar("You join succefuly", context);
    });
  }

  void leaveGame(String collection, String groundId, String reserveId,
      BuildContext context) async {
    final userId = "osama";
    final res = await _playRepository.leaveGame(
        collection, groundId, reserveId, userId);

    res.fold((l) => showSnackBar(l.message, context), (r) {
      //  Get.to(HomeMain());
      showSnackBar("You Leave The Game", context);
    });
  }

  Stream<List<GroundModel>> getGrounds(String collection) {
    return _playRepository.getGrounds(collection);
  }

  Stream<List<ReserveModel>> getReservisions(
      ReservationsParams reservationsParams) {
    return _playRepository.getReservisions(reservationsParams.collection,
        reservationsParams.groundId, reservationsParams.day);
  }

  Stream<List<GroundModel>> searchGrounds(String query) {
    return _playRepository.searchFootballGrounds(query);
  }

  Stream<List<ReserveModel>> getuserGrounds() {
    String userId = "";
    return _playRepository.getuserGrounds(userId);
  }

  //**************************futuers only for ground owner*******************************************

  void setGround(
      int price,
      String name,
      String phone,
      String futures,
      File FilegroundImage,
      BuildContext context,
      String collection,
      int groundPlayersNum) async {
    state = StatusRequest.loading;
    String id = Uuid().v1();
    String address;
    Position position;
    String groundImage = "";
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

    final res = await _storageRepository.storeFile(
        path: "Grounds", id: collection, file: FilegroundImage);

    res.fold((l) => showSnackBar(l.toString(), context), (r) {
      groundImage = r;
    });
//set data
    if (groundImage != "") {
      GroundModel groundModel = GroundModel(
          groundnumber: "01220065480",
          rating: 0,
          groundPlayersNum: groundPlayersNum,
          id: id,
          name: name,
          address: address,
          groundOwnerId: "soon",
          groundImage: groundImage,
          price: price,
          ownerNum: phone,
          futuers: futures,
          long: position.longitude,
          lat: position.latitude);

      final res = await _playRepository.setGround(groundModel, collection);
      state = StatusRequest.success;
      res.fold((l) => showSnackBar(l.toString(), context),
          (r) => showSnackBar("Your Ground Added Succefuly", context));
    }
  }

  void setResrvision(String groundId, BuildContext context, String collection,
      int maxPlayersNum, String time, String day) async {
    state = StatusRequest.loading;
    String id = Uuid().v1();

    ReserveModel reserveModel = ReserveModel(
        maxPlayersNum: maxPlayersNum,
        category: collection,
        targetplayesNum: 0,
        id: id,
        groundId: groundId,
        userId: "userId",
        iscomplete: true,
        collaborations: [],
        time: time,
        day: day,
        isresrved: false);

    final res = await _playRepository.setreservision(
        groundId, collection, reserveModel);
    state = StatusRequest.success;

    res.fold((l) => showSnackBar(l.toString(), context), (r) {
      Get.to(() => AnimatedReservisionScreen());
      showSnackBar("Your reserve Added Succefuly", context);
    });
  }
}
