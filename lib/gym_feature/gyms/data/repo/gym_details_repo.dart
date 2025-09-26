import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/common/entities/user_model.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/gym_feature/gyms/data/datasources/gym_remote_data_source.dart';
import 'package:kamn/gym_feature/gyms/data/models/gym_model.dart';

abstract class GymDetailsRepository {
  Future<GymModel?> getGymDetails(String gymId);
  Future<List<GymModel>> getAllGyms();
  Future<Either<Faliure, List<Feature>>> getGymFeatures(String gymId);
  Future<Either<Faliure, List<Plan>>> getGymPlans(String gymId);
  Future<Either<Faliure, UserModel>> getUserById(String userId);
}

@Injectable(as: GymDetailsRepository)
class GymDetailsRepositoryImpl implements GymDetailsRepository {
  final GymDetailsRemoteDataSource remoteDataSource;

  GymDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<GymModel?> getGymDetails(String gymId) async {
    try {
      final gym = await remoteDataSource.getGymById(gymId);
      return gym;
    } catch (e) {
      throw Exception('Failed to fetch gym details: $e');
    }
  }

  @override
  Future<List<GymModel>> getAllGyms() async {
    try {
      final gyms = await remoteDataSource.getAllGyms();
      return gyms;
    } catch (e) {
      throw Exception('Failed to fetch all gyms: $e');
    }
  }

  @override
  Future<Either<Faliure, List<Feature>>> getGymFeatures(String gymId) {
    return executeTryAndCatchForRepository(
      () async {
        final features = await remoteDataSource.getGymFeatures(gymId);
        return features
            .map((element) => Feature.fromMap(element))
            .toList();
      },
    );
  }
  
  @override
  Future<Either<Faliure, List<Plan>>> getGymPlans(String gymId) {
  return executeTryAndCatchForRepository(
      () async {
        final plans = await remoteDataSource.getGymPlans(gymId);
        return plans
            .map((element) => Plan.fromMap(element))
            .toList();
      },
    );
  }
  @override
  Future<Either<Faliure, UserModel>> getUserById(String userId) {
    return executeTryAndCatchForRepository(
      () async {
        final user = await remoteDataSource.getUserById(userId);
        return UserModel.fromMap(user ?? {});
      },
    );
  }
}
