import 'package:flutter/material.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService _service = WeatherService();

  bool loading = false;
  String? error;
  Map<String, dynamic>? data;

  /// Load weather for any coordinates
  Future<void> loadWeather({required double lat, required double lon}) async {
    loading = true;
    error = null;
    data = null;
    notifyListeners();

    try {
      data = await _service.fetchWeather(lat: lat, lon: lon);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
