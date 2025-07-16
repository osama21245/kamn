import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/class/firestore_services.dart';
import 'package:kamn/core/common/entities/user_model.dart';
import 'package:path/path.dart';
import '../../../../core/const/firebase_collections.dart';
import '../../../../core/utils/try_and_catch.dart';

abstract interface class UserRemoteDataSource {
  Future<List<Map<String, dynamic>>> getNotifications(String userId);
  Future<void> markNotificationAsRead(String notificationId);
  Future<void> updateUserInfo(UserModel user);
  Future<String> addImagesToStorage(File images) ;
  Future<UserModel> getUsersInfo(String uid);
}

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirestoreService _firestoreService;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  UserRemoteDataSourceImpl({required FirestoreService firestoreService})
      : _firestoreService = firestoreService;

  @override
  Future<List<Map<String, dynamic>>> getNotifications(String userId) async {
    return await executeTryAndCatchForDataLayer(() async {
      final querySnapshot = await _firestoreService.firestore
          .collection(FirebaseCollections.notifications)
          .where('userId', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Future<void> markNotificationAsRead(String notificationId) async {
    return await executeTryAndCatchForDataLayer(() async {
      await _firestoreService.firestore
          .collection(FirebaseCollections.notifications)
          .doc(notificationId)
          .update({'isRead': true});
    });
  }
  @override
  Future<void> updateUserInfo(UserModel user) {
   return executeTryAndCatchForDataLayer((){
    final dofRef=_firestoreService.firestore.collection(FirebaseCollections.users).doc(user.uid);
    return dofRef.update(user.toMap());
   });
  }
  
  @override
  Future<String> addImagesToStorage(File images) async {
    return executeTryAndCatchForDataLayer(() async {
      Reference firebaseStorageRef =
          _firebaseStorage.ref().child(basename(images.path));

      UploadTask uploadTask = firebaseStorageRef.putFile(images);

      TaskSnapshot taskSnapshot =
          await uploadTask.timeout(const Duration(seconds: 100));

      String downloadUrl = await taskSnapshot.ref
          .getDownloadURL()
          .timeout(const Duration(seconds: 30));
      return downloadUrl;
    });
  }
  @override
  Future<UserModel> getUsersInfo(String uid) async {
    final doc = await _firestoreService.firestore
        .collection(FirebaseCollections.users).doc(uid)
        .get();

    return  UserModel.fromMap(doc.data() ??{});
  }
}
