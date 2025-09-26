import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_reservation.dart';
import 'package:kamn/playground_feature/sports/data/models/reservation_model.dart';
import '../../../../core/utils/try_and_catch.dart';
import '../data_source/sports_remote_data_source.dart';
import '../models/playground_model.dart';

abstract class SportsRepository {
  Future<Either<Faliure, List<PlaygroundModel>>> getPlaygrounds();
  Future<Either<Faliure, GymReservation>> submitReservation(
      GymReservation reservation);
  Future<Either<Faliure, void>> updateState(
      String playgroundId, Map<String, dynamic> data);
  Future<Either<Faliure, void>> setData(
      String playgroundId, Map<String, dynamic> data);
  Future<Either<Faliure, void>> delete(ReservationModel reservation);
  Future<Either<Faliure, List<ReservationModel>>> getUserReservations(
      String userId);
  Future<Either<Faliure, List<ReservationModel>>>
      getSpecificReservationsByGroundId(String groundId, DateTime selectedDate);
  Future<Either<Faliure, List<PlaygroundModel>?>> searchByQuery(String query,String type);
}

@Injectable(as: SportsRepository)
class SportsRepositoryImpl implements SportsRepository {
  final SportsRemoteDataSource _remoteDataSource;
  SportsRepositoryImpl({required SportsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<Either<Faliure, List<PlaygroundModel>>> getPlaygrounds() async {
    return executeTryAndCatchForRepository(() async {
      var data = await _remoteDataSource.getPlaygrounds();
      return data.map((value) {
        return PlaygroundModel.fromMap(value);
      }).toList();
    });
  }

  @override
  Future<Either<Faliure, GymReservation>> submitReservation(
      GymReservation reservation) {
    return executeTryAndCatchForRepository(() async {
      return await _remoteDataSource.submitReservation(reservation);
    });
  }

  @override
  Future<Either<Faliure, void>> updateState(
      String playgroundId, Map<String, dynamic> data) {
    return executeTryAndCatchForRepository(() async {
      return await _remoteDataSource.updateState(playgroundId, data);
    });
  }

  @override
  Future<Either<Faliure, void>> delete(ReservationModel reservation) {
    return executeTryAndCatchForRepository(() async {
      return await _remoteDataSource.delete(reservation);
    });
  }

  @override
  Future<Either<Faliure, List<ReservationModel>>> getUserReservations(
      String userId) {
    return executeTryAndCatchForRepository(() async {
      var response = await _remoteDataSource.getUserReservations(userId);
      return response.map((element) {
        return ReservationModel.fromMap(element);
      }).toList();
    });
  }

  @override
  Future<Either<Faliure, List<PlaygroundModel>?>> searchByQuery(String query,String type) {
    return executeTryAndCatchForRepository(() async {
      final List<Map<String, dynamic>> rawData =
          await _remoteDataSource.searchByQuery(query,type);

      final playgrounds =
          rawData.map((data) => PlaygroundModel.fromMap(data)).toList();

      return playgrounds;
    });
  }

  @override
  Future<Either<Faliure, List<ReservationModel>>>
      getSpecificReservationsByGroundId(
          String groundId, DateTime selectedDate) {
    return executeTryAndCatchForRepository(() async {
      var response = await _remoteDataSource.getSpecificReservationsByGroundId(
          groundId, selectedDate);
      return response.map((element) {
        return ReservationModel.fromMap(element);
      }).toList();
    });
  }
  
  @override
  Future<Either<Faliure, void>> setData(String playgroundId, Map<String, dynamic> data) {
  return executeTryAndCatchForRepository(() async {
      return await _remoteDataSource.setData(playgroundId, data);
    });
  }
  
  
}
