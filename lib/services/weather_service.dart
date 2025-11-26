import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String baseUrl = "https://weather-api-bict.onrender.com";

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final uri = Uri.parse("$baseUrl/api/weather?city=$city");

    final res = await http.get(uri);

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception("Failed: ${res.statusCode}");
    }
  }
}
