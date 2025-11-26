import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';
import '../widgets/hourly_forcast_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    // Example coordinates, you can replace or make dynamic
    final double lat = 28.0;
    final double lon = 77.0;

    return Scaffold(
      appBar: AppBar(title: const Text("Weather App"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                provider.loadWeather(lat: lat, lon: lon);
              },
              child: Text("Load Weather (lat=$lat, lon=$lon)"),
            ),

            const SizedBox(height: 20),

            if (provider.loading) const CircularProgressIndicator(),

            if (provider.error != null)
              Text(provider.error!, style: const TextStyle(color: Colors.red)),

            if (provider.data != null) ...[
              WeatherCard(weather: provider.data!),
              const SizedBox(height: 20),
              HourlyList(hourly: provider.data!["hourly"]),
            ],
          ],
        ),
      ),
    );
  }
}
