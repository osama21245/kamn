import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/const/firebase_collections.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';

abstract class GymReservationsRemoteDataSource {
  Future<List<GymReservation>> getUserReservations(String userId);
  Future<GymReservation?> getReservationById(String reservationId);
  Future<void> cancelReservation(String reservationId);
  Future<void> updateReservationStatus(String reservationId, bool isConfirmed);
}

@Injectable(as: GymReservationsRemoteDataSource)
class GymReservationsRemoteDataSourceImpl implements GymReservationsRemoteDataSource {
  GymReservationsRemoteDataSourceImpl();
  final firestore = FirebaseFirestore.instance;

  CollectionReference get _reservationsCollection =>
      firestore.collection(FirebaseCollections.reservations);

  @override
  Future<List<GymReservation>> getUserReservations(String userId) async {
    return executeTryAndCatchForDataLayer(() async {
      final querySnapshot = await _reservationsCollection
          .where('user.uid', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return <GymReservation>[];
      }

      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return GymReservation.fromJson(data);
      }).toList();
    });
  }

  @override
  Future<GymReservation?> getReservationById(String reservationId) async {
    return executeTryAndCatchForDataLayer(() async {
      final docSnapshot = await _reservationsCollection.doc(reservationId).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        data['id'] = docSnapshot.id;
        return GymReservation.fromJson(data);
      }

      return null;
    });
  }

  @override
  Future<void> cancelReservation(String reservationId) async {
    return executeTryAndCatchForDataLayer(() async {
      await _reservationsCollection.doc(reservationId).update({
        'isCancelled': true,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    });
  }

  @override
  Future<void> updateReservationStatus(String reservationId, bool isConfirmed) async {
    return executeTryAndCatchForDataLayer(() async {
      await _reservationsCollection.doc(reservationId).update({
        'isConfirmed': isConfirmed,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    });
  }
}