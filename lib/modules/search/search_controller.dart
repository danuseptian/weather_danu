import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_danu/models/weather_model.dart';
import 'package:weather_danu/services/weather_service.dart';

class SearchController extends GetxController {
  late TextEditingController cityC;
  WeatherResponse? weatherResponse;
  bool isLoading = false;

  searchCity() async {
    weatherResponse = await WeatherService.getWeather(cityC.text);
    isLoading = true;
    update();
  }

  weatherStatus() {
    if (weatherResponse?.weather == 'broken clouds') {
      return 'assets/icons/broken_clouds.png';
    }
    if (weatherResponse?.weather == 'clear sky') {
      return 'assets/icons/clear_sky.png';
    }
    if (weatherResponse?.weather == 'few clouds') {
      return 'assets/icons/few_clouds.png';
    }
    if (weatherResponse?.weather == 'mist') {
      return 'assets/icons/mist.png';
    }
    if (weatherResponse?.weather == 'rain') {
      return 'assets/icons/rain.png';
    }
    if (weatherResponse?.weather == 'scattered clouds') {
      return 'assets/icons/scattered_clouds.png';
    }
    if (weatherResponse?.weather == 'shower rain') {
      return 'assets/icons/shower_rain.png';
    }
    if (weatherResponse?.weather == 'snow') {
      return 'assets/icons/snow.png';
    }
    if (weatherResponse?.weather == 'thunderstorm') {
      return 'assets/icons/thunderstorm.png';
    } else {
      return 'assets/icons/clear_sky.png';
    }
  }

  @override
  void onInit() async {
    cityC = TextEditingController();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cityC.dispose();
  }
}
