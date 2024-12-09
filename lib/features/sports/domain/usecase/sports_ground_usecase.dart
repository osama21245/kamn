import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:kamn/core/utils/location.dart';
import 'package:kamn/features/sports/data/models/playground_model.dart';
import 'package:kamn/features/sports/data/repositories/sports_repository.dart';

@injectable
class SportsGroundUsecase {
  final SportsRepository _sportsRepository;

  SportsGroundUsecase({required SportsRepository sportsRepository})
      : _sportsRepository = sportsRepository;

  Future<Either<Faliure, List<PlaygroundModel>>> filterGoundData(
      {num? maxPrice,
      num? minPrice,
      String? location,
      double? distance}) async {
    List<PlaygroundModel> fliterData = [];
    var userLocation = await getUserLocation();
    var result = await _sportsRepository.getPlaygrounds();
    return result.fold((error) => Left(error), (data) {
      fliterData = data!.where((element) {
        return priceRange(
                maxPrice: maxPrice, minPrice: minPrice, price: element.price) &&
            locationChecker(address: element.address, location: location) &&
            claculateDistance(
              distance: distance,
              goundLatitude: element.latitude!.toDouble(),
              groundLongitude: element.longitude!.toDouble(),
              userLatitude: userLocation['latitude'],
              userLongitude: userLocation['longitude'],
            );
      }).toList();
      return Right(fliterData);
    });
  }
}

bool priceRange({num? maxPrice, num? minPrice, num? price}) {
  if ((maxPrice == null && minPrice == null)) {
    return true;
  } else if ((maxPrice != null && minPrice != null) &&
      (price! >= minPrice && price <= maxPrice)) {
    return true;
  } else if (minPrice == null && maxPrice != null && price! <= maxPrice) {
    return true;
  } else if (maxPrice == null && minPrice != null && price! >= minPrice) {
    return true;
  }
  return false;
}

bool locationChecker({String? location, String? address}) {
  if (location == null || location == '') {
    return true;
  }
  return address!.toLowerCase().contains(location.toLowerCase());
}

bool claculateDistance(
    {double? distance,
    double? goundLatitude,
    double? groundLongitude,
    double? userLatitude,
    double? userLongitude}) {
  if (distance != null && distance != 0) {
    var realDistance = Geolocator.distanceBetween(
            goundLatitude!, groundLongitude!, userLatitude!, userLongitude!) /
        1000;
    return realDistance <= distance ? true : false;
  }
  return true;
}

Future<Map<String, double>> getUserLocation() async {
  var response = await getLocationCoordinates();
  Map<String, double> data = {};
  response.fold((error) {}, (success) {
    data = success;
  });
  return data;
}
