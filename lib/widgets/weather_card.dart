import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather["location"],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "${weather["temperature"]}°C",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              weather["condition"],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text("Humidity: ${weather["humidity"]}%"),
            Text("Wind Speed: ${weather["windSpeed"]} km/h"),
            Text("Pressure: ${weather["pressure"]} hPa"),
            Text("Visibility: ${weather["visibility"]} m"),
          ],
        ),
      ),
    );
  }
}
