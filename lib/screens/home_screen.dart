import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Weather App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                label: const Text("Enter city name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (value) => provider.getWeather(value),
            ),
            const SizedBox(height: 20),

            if (provider.loading) const CircularProgressIndicator(),
            if (provider.error != null)
              Text(provider.error!, style: const TextStyle(color: Colors.red)),
            if (provider.data != null) WeatherCard(weather: provider.data!),
          ],
        ),
      ),
    );
  }
}
