import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/core/constants/services/services.dart';
import 'package:kman/featuers/auth/screens/finish_screen.dart';
import 'package:kman/featuers/auth/screens/login_screen.dart';
import 'package:kman/homemain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/constants.dart';
import '../../../core/providers/storage_repository.dart';
import '../../../core/utils.dart';
import '../../../models/reserved_model.dart';
import '../../../models/user_model.dart';
import '../repositories/auth_repository.dart';

final authStateCahngeProvider = StreamProvider((ref) {
  final authcontroller = ref.watch(authControllerProvider.notifier);
  return authcontroller.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authcontroller = ref.watch(authControllerProvider.notifier);
  return authcontroller.getUserData(uid);
});
final getUserDataFutureProvider = FutureProvider.family((ref, String uid) {
  final authcontroller = ref.watch(authControllerProvider.notifier);
  return authcontroller.getUserFutureData(uid);
});

final getUserReservisionss = StreamProvider(
    (ref) => ref.watch(authControllerProvider.notifier).getUserResevisions());

StateProvider<UserModel?> usersProvider =
    StateProvider<UserModel?>((ref) => null);

StateNotifierProvider<AuthController, StatusRequest> authControllerProvider =
    StateNotifierProvider<AuthController, StatusRequest>((ref) =>
        AuthController(
            authRepository: ref.watch(AuthRepositoryProvider),
            ref: ref,
            storageRepository: ref.watch(storageRepositoryProvider)));

class AuthController extends StateNotifier<StatusRequest> {
  final Ref _ref;
  final AuthRepository _authRepository;
  final StorageRepository _storageRepository;
  AuthController(
      {required AuthRepository authRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _authRepository = authRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(StatusRequest.success);
  bool? inUpdate;
  UserModel? userModel;

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }

  Future<UserModel> getUserFutureData(String uid) {
    return _authRepository.getUserDataFuture(uid);
  }

  Stream<List<ReserveModel>> getUserResevisions() {
    final user = _ref.watch(usersProvider);
    return _authRepository.getUserResevisions(user!.uid);
  }

  UserModel? loadUserModelFromPrefs() {
    MyServices myServices =
        Get.find(); // Retrieve the UserModel from shared preferences
    String? userModelJson = myServices.sharedPreferences.getString('userModel');
    if (userModelJson != null) {
      // If UserModel exists in shared preferences, parse and return it
      return UserModel.fromJson(json.decode(userModelJson));
    } else {
      // If UserModel doesn't exist, return null or a default value
      return null;
    }
  }

  Future<void> saveUserModelToPrefs(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convert UserModel to JSON and save it in shared preferences
    String userModelJson = json.encode(userModel.toJson());
    prefs.setString('userModel', userModelJson);
  }

  signinWithGoogle(BuildContext context, bool isFromLogin) async {
    state = StatusRequest.loading;
    final user = await _authRepository.signinWithGoogle(isFromLogin);
    state = StatusRequest.success;
    MyServices myServices = Get.find();
    user.fold((l) => showSnackBar(l.message, context), (userModel) async {
      myServices.sharedPreferences.setString("step", "2");
      await _ref.read(usersProvider.notifier).update((state) => userModel);
      await saveUserModelToPrefs(userModel);
      Get.offAll(() => HomeMain());
    });
  }

  void signInAsGuest(BuildContext context) async {
    state = StatusRequest.loading;
    final user = await _authRepository.signInAsGuest();
    state = StatusRequest.success;
    MyServices myServices = Get.find();

    user.fold((l) => showSnackBar(l.message, context), (userModel) async {
      myServices.sharedPreferences.setString("step", "2");
      _ref.read(usersProvider.notifier).update((state) => userModel);
    });
  }

  void editUser(
      {required File? profileFile,
      required BuildContext context,
      required UserModel userModel,
      required WidgetRef ref}) async {
    state = StatusRequest.loading;

    if (profileFile != null) {
      final res = await _storageRepository.storeFile(
          path: "user/profile", id: userModel.name, file: profileFile);

      res.fold((l) => showSnackBar(l.toString(), context),
          (r) => userModel = userModel.copyWith(profilePic: r));
    }

    final res = await _authRepository.editUser(userModel);
    state = StatusRequest.success;

    res.fold((l) => showSnackBar(l.message, context), (r) async {
      await saveUserModelToPrefs(userModel);
      await ref.read(usersProvider.notifier).update((state) => userModel);
      Get.back();
    });
  }

  getAppState() async {
    final res = await _authRepository.getAppStatus();
    res.fold((l) {}, (r) {
      inUpdate = r;
    });
  }

  void setUserData(String name, String uid, String phone, String age,
      String city, String country, String gender, BuildContext context) async {
    UserModel userModel = UserModel(
        isactive: false,
        followers: [],
        name: '$name',
        profilePic: Constants.avatarDefault,
        uid: uid,
        isAuthanticated: true,
        points: 0,
        phone: phone,
        age: "$age",
        awards: [],
        city: "$city",
        country: "$country",
        myGrounds: [],
        state: "0",
        gender: "$gender",
        isonline: false,
        ingroup: []);

    final res = await _authRepository.setUserData(userModel, phone);
    res.fold(
        (l) => showSnackBar(l.message, context), (r) => Get.to(LoginScreen()));
  }

  void createAccountWithEmailAndPassword(
      String email,
      String password,
      BuildContext context,
      String name,
      String phone,
      String age,
      String city,
      String country,
      String gender) async {
    state = StatusRequest.loading;

    final res = await _authRepository.createAccountWithEmailAndPassword(
        email, password);

    res.fold((l) => showSnackBar(l.message, context), (r) async {
      UserCredential userCredential = r;
      setUserData(name, userCredential.user!.uid, phone, age, city, country,
          gender, context);
      state = StatusRequest.success;
    });
  }

  getAnyUserData(String email, BuildContext context) async {
    final res = await _authRepository.getAnyUserData(email);
    res.fold((l) => showSnackBar(l.message, context), (r) {
      userModel = r;
    });
  }

  void signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    state = StatusRequest.loading;
    final res =
        await _authRepository.signInWithEmailAndPassword(email, password);
    state = StatusRequest.success;
    MyServices myServices = Get.find();

    res.fold((l) => showSnackBar(l.message, context), (r) async {
      final res = await _authRepository.getAnyUserData(email);
      res.fold((l) => showSnackBar(l.message, context), (userModel) async {
        myServices.sharedPreferences.setString("step", "2");
        await _ref.read(usersProvider.notifier).update((state) => userModel);
        await saveUserModelToPrefs(userModel);
        Get.offAll(HomeMain());
      });
    });
  }

  void verifyPhone(BuildContext context, String phone) async {
    final res = await _authRepository.verifyPhone(phone);

    res.fold((l) => showSnackBar(l.message, context), (r) {});
  }

  void sendCode(String code, BuildContext context, String phone) async {
    state = StatusRequest.loading;
    final res = await _authRepository.sendCode(code);
    state = StatusRequest.success;
    res.fold((l) => showSnackBar(l.message, context), (r) {
      Get.to(() => FinishScreen(
            phone: phone,
          ));
    });
  }

  void logOut() async {
    MyServices myServices = Get.find();
    _authRepository.logOut();
    myServices.sharedPreferences.clear();
    myServices.sharedPreferences.setString("step", "1");
    Get.offAll(() => LoginScreen());
  }

  void updateUserStatus(bool isonline, BuildContext context) async {
    final uid = _ref.read(usersProvider)!.uid;
    final res = await _authRepository.updateUserState(uid, isonline);
    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }
}
