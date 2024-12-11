import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart';
import 'package:kamn/features/sports_service_providers/data/model/failure.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_request_model.dart';
import 'dart:async';

import 'package:kamn/features/sports_service_providers/data/model/reservation_model.dart';

abstract class ServiceProvidersRepository {
  Future<Either<Faliure, void>> addServiceToFirestore(
      PlaygroundRequestModel playground);

  Future<Either<Faliure, List<String>>> addImagesToStorage(List<File> images);

  Future<Either<Faliure, bool>> deleteImagesFromStorage(List<String> images);

  Future<Either<Faliure, List<PlaygroundRequestModel>>>
      getPlaygroundsRequests();

  Future<Either<Faliure, void>> addWithTransactionToFirebase(
      PlaygroundModel playground);
  Future<Either<Faliure, void>> updateState(
      String playgroundId, Map<String, dynamic> data);
}

@Injectable(as: ServiceProvidersRepository)
class ServiceProvidersRepositoryImpl implements ServiceProvidersRepository {
  ServiceProvidersRemoteDataSource dataSource;
  ServiceProvidersRepositoryImpl({required this.dataSource});
  //TODO:Check connectivity  in executeTryAndCatchForRepository /* done
  @override
  Future<Either<Faliure, void>> addServiceToFirestore(
      PlaygroundRequestModel playground) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addServiceToFirestore(playground);
    });
  }

  @override
  Future<Either<Faliure, List<String>>> addImagesToStorage(
      List<File> images) async {
    return executeTryAndCatchForRepository(() async {
      return dataSource.addImagesToStorage(images);
    });
  }

  @override
  Future<Either<Faliure, bool>> deleteImagesFromStorage(
      List<String> images) async {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.deleteImagesFromStorage(images);
    });
  }

  @override
  Future<Either<Faliure, List<PlaygroundRequestModel>>>
      getPlaygroundsRequests() {
    return executeTryAndCatchForRepository(() async {
      var data = await dataSource.getPlaygroundsRequests();
      return data.map((value) {
        return PlaygroundRequestModel.fromMap(value);
      }).toList();
    });
  }

  @override
  Future<Either<Faliure, void>> addWithTransactionToFirebase(
      PlaygroundModel playground) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addWithTransactionToFirebase(playground);
    });
  }

  @override
  Future<Either<Faliure, void>> updateState(
      String playgroundId, Map<String, dynamic> data) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.updateState(playgroundId, data);
    });
  }
}

abstract class FinishedOrdersRepository {
  Future<Either<Failure, List<Reservation>>> fetchOrdersByCategory(
      String category);
}

class FinishedOrdersRepositoryImp implements FinishedOrdersRepository {
  final FinishedOrdersRemoteDataSource remoteDataSource;

  FinishedOrdersRepositoryImp(this.remoteDataSource);

  Future<Either<Failure, List<Reservation>>> fetchOrdersByCategory(
      String category) {
    return remoteDataSource.fetchOrdersByCategory(category);
  }
}

abstract class CurrentOrdersRepository {
  Future<Either<Failure, List<Reservation>>> fetchOrdersByCategory(
      String category);
}

class CurrentOrdersRepositoryImp implements CurrentOrdersRepository {
  final FinishedOrdersRemoteDataSource remoteDataSource;

  CurrentOrdersRepositoryImp(this.remoteDataSource);

  Future<Either<Failure, List<Reservation>>> fetchOrdersByCategory(
      String category) {
    return remoteDataSource.fetchOrdersByCategory(category);
  }
}
