import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

abstract class GymDetailsRemoteDataSource {
  Future<GymModel?> getGymById(String gymId);
  Future<List<GymModel>> getAllGyms();
  Future<List<Map<String, dynamic>>> getGymFeatures(String gymId);
  Future<List<Map<String, dynamic>>> getGymPlans(String gymId);
  Future<Map<String, dynamic>?> getUserById(String userId);
}

@Injectable(as: GymDetailsRemoteDataSource)
class GymDetailsRemoteDataSourceImpl implements GymDetailsRemoteDataSource {
  GymDetailsRemoteDataSourceImpl();
  final firestore = FirebaseFirestore.instance;

  CollectionReference get _gymsCollection =>
      firestore.collection(FirebaseCollections.gym);

  @override
  Future<GymModel?> getGymById(String gymId) async {
    try {
      final docSnapshot = await _gymsCollection.doc(gymId).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        print("dattttttta${data["scoialMediaLinks"]}");
        return GymModel.fromMap(data);
      }

      return null;
    } catch (e) {
      throw Exception('Failed to get gym by ID: $e');
    }
  }

  @override
  Future<List<GymModel>> getAllGyms() async {
    try {
      final querySnapshot = await _gymsCollection.get();

      if (querySnapshot.docs.isEmpty) {
        return [];
      }

      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        print("all gym data ${data["scoialMediaLinks"]}");
        if (!data.containsKey('imagesUrl')) {
          data['imagesUrl'] = [];
        } else if (data['imagesUrl'] == null) {
          data['imagesUrl'] = [];
        }

        return GymModel.fromMap(data);
      }).toList();
    } catch (e) {
      throw Exception('Failed to get all gyms: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getGymFeatures(String gymId) async {
    return executeTryAndCatchForDataLayer(() async {
      final featuresSnapshot =
          await _gymsCollection.doc(gymId).collection(FirebaseCollections.features).get();
      print("featuresssss${featuresSnapshot.docs.length} features found");
      return featuresSnapshot.docs.map((doc) => doc.data()).toList();
    });
  }
  
  @override
  Future<List<Map<String, dynamic>>> getGymPlans(String gymId) {
   return executeTryAndCatchForDataLayer(() async {
      final plansSnapshot =
          await _gymsCollection.doc(gymId).collection('plans').get();
      print("plans${plansSnapshot.docs.length} plans found");
      return plansSnapshot.docs.map((doc) => doc.data()).toList();
    });
  }
  @override
  Future<Map<String, dynamic>?> getUserById(String userId) async {
    return executeTryAndCatchForDataLayer(() async {
      final userDoc = await firestore
          .collection('users')
          .doc(userId)
          .get();

      if (!userDoc.exists) {
        return null;
      }

      return userDoc.data();
    });
  }
}
