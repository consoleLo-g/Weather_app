import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final location = "${weather['city'] ?? '-'}, ${weather['country'] ?? '-'}";
    final current = weather['current'] ?? {};
    final temperature = current['temperature']?.toString() ?? "-";
    final windSpeed = current['windspeed']?.toString() ?? "-";

    // Use first hourly entry for humidity, pressure, visibility (if current not available)
    final firstHour =
        (weather['hourly'] != null && weather['hourly'].isNotEmpty)
        ? weather['hourly'][0]
        : {};

    final humidity = firstHour['humidity']?.toString() ?? "-";
    final pressure = firstHour['pressure']?.toString() ?? "-";
    final visibility = firstHour['visibility']?.toString() ?? "-";

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location, style: Theme.of(context).textTheme.headlineSmall),
            Text(
              "$temperature°C",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "Wind: $windSpeed km/h",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text("Humidity: $humidity%"),
            Text("Pressure: $pressure hPa"),
            Text("Visibility: $visibility m"),
          ],
        ),
      ),
    );
  }
}
