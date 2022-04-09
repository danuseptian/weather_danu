class WeatherLocationResponse {
  final double? lon;
  final double? lat;
  final double? temp, windSpeed;
  final String? cityName, weather;
  final int? timeZone;

  WeatherLocationResponse({
    this.lon,
    this.lat,
    this.weather,
    this.cityName,
    this.temp,
    this.windSpeed,
    this.timeZone,
  });

  factory WeatherLocationResponse.fromJson(Map<String, dynamic> json) {
    final lon = json['coord']['lon'] ?? '';
    final lat = json['coord']['lat'] ?? '';
    final cityName = json['name'] ?? 'Not found';
    final weather = json['weather'][0]['description'] ?? '';
    final temp = json['main']['temp'] ?? '';
    final windSpeed = json['wind']['speed'] ?? '';
    final timeZone = json['timezone'] ?? '';

    return WeatherLocationResponse(
      lon: lon,
      lat: lat,
      cityName: cityName,
      weather: weather,
      temp: temp,
      windSpeed: windSpeed,
      timeZone: timeZone,
    );
  }
}

class WeatherResponse {
  final String? cityName, weather, icon;
  final double? temp, windSpeed;
  final int? timeZone;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${icon}@2x.png';
  }

  WeatherResponse({
    this.cityName,
    this.weather,
    this.icon,
    this.temp,
    this.windSpeed,
    this.timeZone,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'] ?? 'Not found';
    final weather = json['weather'][0]['description'] ?? '';
    final icon = json['weather'][0]['icon'] ?? '';
    final temp = json['main']['temp'] ?? '';
    final windSpeed = json['wind']['speed'] ?? '';
    final timeZone = json['timezone'] ?? '';

    return WeatherResponse(
      cityName: cityName,
      weather: weather,
      icon: icon,
      temp: temp,
      windSpeed: windSpeed,
      timeZone: timeZone,
    );
  }
}
