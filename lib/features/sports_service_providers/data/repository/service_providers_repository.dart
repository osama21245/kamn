import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/try_and_catch.dart';
import 'package:kamn/features/sports_service_providers/data/data_source/service_providers_remote_data_source.dart';
import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';
import 'dart:async';

abstract class ServiceProvidersRepository {
  Future<Either<Faliure, void>> addServiceToFirestore(
      PlaygroundModel playground);
  Future<Either<Faliure, List<String>>> addFImagesToStorage(List<File> images);
}

class ServiceProvidersRepositoryImpl implements ServiceProvidersRepository {
  ServiceProvidersRemoteDataSource dataSource;
  ServiceProvidersRepositoryImpl({required this.dataSource});
  //TODO:Check connectivity  in executeTryAndCatchForRepository /* done
  @override
  Future<Either<Faliure, void>> addServiceToFirestore(
      PlaygroundModel playground) {
    return executeTryAndCatchForRepository(() async {
      return await dataSource.addServiceToFirestore(playground);
    });
  }

  @override
  Future<Either<Faliure, List<String>>> addFImagesToStorage(
      List<File> images) async {
    return executeTryAndCatchForRepository(() async {
      return dataSource.addImagesToStorage(images);
    });
  }
}
