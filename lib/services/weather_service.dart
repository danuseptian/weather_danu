import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  static Future getWeather(String? city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': 'd6063fbaf4da5678bcfe6357e3a435ba',
      'units': 'imperial',
    };
    var client = http.Client();

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherResponse.fromJson(json);
    }
  }

  static Future getMyLocationWeather(double? lat, double? lon) async {
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    var client = http.Client();

    final uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=d6063fbaf4da5678bcfe6357e3a435ba&units=imperial');

    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherLocationResponse.fromJson(json);
    }
  }
}
