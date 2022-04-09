import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_danu/models/weather_model.dart';
import 'package:weather_danu/services/geolocation_service.dart';
import 'package:weather_danu/services/weather_service.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  WeatherLocationResponse? weatherLocationResponse;
  Position? position;

  weatherStatus() {
    if (weatherLocationResponse?.weather == 'broken clouds') {
      return 'assets/icons/broken_clouds.png';
    }
    if (weatherLocationResponse?.weather == 'clear sky') {
      return 'assets/icons/clear_sky.png';
    }
    if (weatherLocationResponse?.weather == 'few clouds') {
      return 'assets/icons/few_clouds.png';
    }
    if (weatherLocationResponse?.weather == 'mist') {
      return 'assets/icons/mist.png';
    }
    if (weatherLocationResponse?.weather == 'rain') {
      return 'assets/icons/rain.png';
    }
    if (weatherLocationResponse?.weather == 'scattered clouds') {
      return 'assets/icons/scattered_clouds.png';
    }
    if (weatherLocationResponse?.weather == 'shower rain') {
      return 'assets/icons/shower_rain.png';
    }
    if (weatherLocationResponse?.weather == 'snow') {
      return 'assets/icons/snow.png';
    }
    if (weatherLocationResponse?.weather == 'thunderstorm') {
      return 'assets/icons/thunderstorm.png';
    } else {
      return 'assets/icons/clear_sky.png';
    }
  }

  @override
  void onInit() async {
    await LocationService.getLocation();
    position = await LocationService.getLocation();
    weatherLocationResponse = await WeatherService.getMyLocationWeather(
        position?.latitude, position?.longitude);
    update();
    isLoading = true;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
