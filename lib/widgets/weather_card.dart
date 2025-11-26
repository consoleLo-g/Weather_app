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
          children: [
            Text(
              "${weather["city"]}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "${weather["temperature"]}°C",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              weather["condition"] ?? "N/A",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text("Humidity: ${weather["humidity"]}%"),
            Text("Wind Speed: ${weather["windSpeed"]} km/h"),
          ],
        ),
      ),
    );
  }
}
