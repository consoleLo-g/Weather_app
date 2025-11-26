import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'screens/home_screen.dart';
import 'providers/weather_provider.dart';

void main() {
  // Initialize logger
  _setupLogging();

  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: const WeatherApp(),
    ),
  );
}

void _setupLogging() {
  Logger.root.level = Level.ALL; // log all levels
  Logger.root.onRecord.listen((record) {
    // Logs will go to Logcat (flutter logs)
    debugPrint(
      '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}',
    );
  });
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
