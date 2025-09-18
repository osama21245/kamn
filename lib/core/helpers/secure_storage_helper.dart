import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import '../common/entities/user_model.dart';

class SecureStorageHelper {
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  static const String _userKey = 'user_data';
  static const String _firstTime = 'first_time';
  static const String _ratingListKey = 'ratingList';
  static const String _interestedListKey = 'interestedList';
  static const String _gymIdKey = 'gym_id_key';
  static final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  // Save user data
  static Future<Either<String, void>> saveUserData(UserModel user) async {
    try {
      await _storage.write(
        key: _userKey,
        value: user.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Get user data
  static Future<Either<String, UserModel?>> getUserData() async {
    try {
      final userData = await _storage.read(key: _userKey);
      if (userData != null) {
        return Right(UserModel.fromJson(userData));
      }
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Remove user data
  static Future<Either<String, void>> removeUserData() async {
    try {
      await _storage.delete(key: _userKey);
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Check if user is logged in
  static Future<Either<String, UserModel>> isUserLoggedIn() async {
    try {
      final userData = await _storage.read(key: _userKey);
      if (userData != null) {
        return Right(UserModel.fromJson(userData));
      }
      return const Left('User is not logged in');
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, String>> isFirstInstallation() async {
    try {
      final flag = await _storage.read(key: _firstTime);
      if (flag != null) {
        return Right(flag);
      }
      return const Left('User is not Install the app');
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, void>> saveInstalltionFlag() async {
    try {
      await _storage.write(
        key: _firstTime,
        value: 'installed',
      );
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Save gym ID
  static Future<Either<String, void>> saveGymId(String gymId) async {
    try {
      await _storage.write(
        key: _gymIdKey,
        value: gymId,
      );
      print("Gym ID saved: $gymId");
      return const Right(null);
    } catch (e) {
      print("Error saving gym ID: ${e.toString()}");
      return Left(e.toString());
    }
  }

  // Get gym ID
  static Future<Either<String, String?>> getGymId() async {
    try {
      final gymId = await _storage.read(key: _gymIdKey);
      print("Retrieved gym ID: $gymId");
      return Right(gymId);
    } catch (e) {
      print("Error retrieving gym ID: ${e.toString()}");
      return Left(e.toString());
    }
  }

  // Get gym ID
  static Future<String?>? getGymIdDirect() async {
    final gymId = await _storage.read(key: _gymIdKey);
    print("Retrieved gym ID: $gymId");
    return gymId;
  }

  // Delete gym ID
  static Future<Either<String, void>> deleteGymId() async {
    try {
      await _storage.delete(key: _gymIdKey);
      print("Gym ID deleted");
      return const Right(null);
    } catch (e) {
      print("Error deleting gym ID: ${e.toString()}");
      return Left(e.toString());
    }
  }

  static Future<void> saveRatingList(List<String> list) async {
    final jsonString = jsonEncode(list);
    await _storage.write(
      key: _ratingListKey,
      value: jsonString,
    );
  }
  static Future<void> saveInterestedList(List<String> list) async {
    final jsonString = jsonEncode(list);
    await _storage.write(
      key: _interestedListKey,
      value: jsonString,
    );
  }

  static Future<List<String>> getStringList() async {
    final jsonString = await _storage.read(key: _ratingListKey);
    if (jsonString != null) {
      return List<String>.from(jsonDecode(jsonString));
    }
    return [];
  }
  static Future<List<String>> getInterestedList() async {
    final jsonString = await _storage.read(key: _interestedListKey);
    if (jsonString != null) {
      return List<String>.from(jsonDecode(jsonString));
    }
    return [];
  }
}
