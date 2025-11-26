import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class WeatherService {
  static const String baseUrl = "https://weather-api-bict.onrender.com";

  final Logger _logger = Logger('WeatherService');

  Future<Map<String, dynamic>> fetchWeather({
    required double lat,
    required double lon,
  }) async {
    final url = Uri.parse("$baseUrl/api/weather?lat=$lat&lon=$lon");
    _logger.info("Requesting: $url");

    final res = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'User-Agent': 'Mozilla/5.0 (Flutter App)',
      },
    );

    _logger.info("Response: ${res.statusCode} ${res.body}");

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      _logger.severe("Failed to fetch weather: ${res.statusCode}");
      throw Exception("Failed to fetch weather: ${res.statusCode}");
    }
  }
}
