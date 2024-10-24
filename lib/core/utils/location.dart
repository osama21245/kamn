import 'package:fpdart/fpdart.dart';
import 'package:kamn/core/erorr/error_constants.dart';
import 'package:kamn/core/erorr/faliure.dart';
import 'package:location/location.dart';

PermissionStatus? permissionGranted;
Location location = Location();
LocationData? locationData;

Future<bool> isPermissionGranted() async {
  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return false;
    }
  }
  return true;
}

Future<bool> isServiceEnabled() async {
  var serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return false;
    }
  }
  return true;
}

Future<Either<Faliure, Map<String, double>>> getLocationCoordinates() async {
  if (!await isPermissionGranted()) {
    return Left(Faliure(ErrorConstants.permissionError));
  }
  if (!await isServiceEnabled()) {
    return Left(Faliure(ErrorConstants.internetServiceError));
  }
  location.changeSettings(accuracy: LocationAccuracy.high);

  locationData = await location.getLocation();
  Map<String, double> coordinates = {
    'longitude': locationData?.longitude ?? 0,
    'latitude': locationData?.altitude ?? 0
  };
  return Right(coordinates);
}
