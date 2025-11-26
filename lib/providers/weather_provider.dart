import 'package:flutter/material.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService _service = WeatherService();

  bool loading = false;
  String? error;
  Map<String, dynamic>? data;

  Future<void> getWeather(String city) async {
    loading = true;
    error = null;
    data = null;
    notifyListeners();

    try {
      data = await _service.fetchWeather(city);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
