import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/faliure.dart';
import 'package:kman/core/providers/firebase_providers.dart';
import 'package:kman/core/type_def.dart';
import 'package:kman/models/coache_model.dart';
import 'package:kman/models/gym_model.dart';
import 'package:url_launcher/url_launcher.dart';

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
    try {
      final whatsappUrl = 'whatsapp://send?phone=+20$phone';

      // Check if the URL can be launched
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        // Launch the URL
        return right(launchUrl(Uri.parse(whatsappUrl)));
      } else {
        // Handle the case where the URL can't be launched
        throw "Could not launch WhatsApp";
      }
    } catch (e) {
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
