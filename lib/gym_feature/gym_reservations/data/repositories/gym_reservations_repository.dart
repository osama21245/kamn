import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/gym_feature/gym_reservations/data/datasources/gym_reservations_remote_data_source.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';

abstract class GymReservationsRepository {
  Future<Either<Faliure, List<GymReservation>>> getUserReservations(String userId);
  Future<Either<Faliure, GymReservation?>> getReservationById(String reservationId);
  Future<Either<Faliure, void>> cancelReservation(String reservationId);
  Future<Either<Faliure, void>> updateReservationStatus(String reservationId, bool isConfirmed);
}

@Injectable(as: GymReservationsRepository)
class GymReservationsRepositoryImpl implements GymReservationsRepository {
  final GymReservationsRemoteDataSource _remoteDataSource;

  GymReservationsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Faliure, List<GymReservation>>> getUserReservations(String userId) async {
    try {
      final reservations = await _remoteDataSource.getUserReservations(userId);
      return Right(reservations);
    } catch (e) {
      return Left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, GymReservation?>> getReservationById(String reservationId) async {
    try {
      final reservation = await _remoteDataSource.getReservationById(reservationId);
      return Right(reservation);
    } catch (e) {
      return Left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, void>> cancelReservation(String reservationId) async {
    try {
      await _remoteDataSource.cancelReservation(reservationId);
      return const Right(null);
    } catch (e) {
      return Left(Faliure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, void>> updateReservationStatus(String reservationId, bool isConfirmed) async {
    try {
      await _remoteDataSource.updateReservationStatus(reservationId, isConfirmed);
      return const Right(null);
    } catch (e) {
      return Left(Faliure(e.toString()));
    }
  }
}