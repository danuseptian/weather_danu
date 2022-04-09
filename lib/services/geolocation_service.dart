import 'package:geolocator/geolocator.dart';

class LocationService {
  static getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  static locationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission;
  }

  static checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission;
  }
}
