import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionHandler {
  static Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission geoPermission;

    // Check location permission using permission_handler
    final status = await Permission.location.status;
    if (status.isDenied) {
      final result = await Permission.location.request();
      if (result.isDenied || result.isPermanentlyDenied) {
        print('Location permissions are denied');
        return false;
      }
    }

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return false;
    }

    // Double check with Geolocator's permission
    geoPermission = await Geolocator.checkPermission();
    if (geoPermission == LocationPermission.denied) {
      geoPermission = await Geolocator.requestPermission();
      if (geoPermission == LocationPermission.denied) {
        print('Location permissions are denied');
        return false;
      }
    }

    if (geoPermission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied');
      await openAppSettings();
      return false;
    }

    return true;
  }

  static Future<Position?> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return null;

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      print('Error getting location: ${e.toString()}');
      return null;
    }
  }

  static Future<bool> checkAndRequestPermission() async {
    // Check both location permissions
    final locationStatus = await Permission.location.status;
    final locationAlwaysStatus = await Permission.locationAlways.status;

    if (locationStatus.isDenied || locationAlwaysStatus.isDenied) {
      // Request permissions
      final locationResult = await Permission.location.request();
      final locationAlwaysResult = await Permission.locationAlways.request();

      return locationResult.isGranted || locationAlwaysResult.isGranted;
    }

    return locationStatus.isGranted || locationAlwaysStatus.isGranted;
  }
}
