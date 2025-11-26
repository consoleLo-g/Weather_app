import 'package:flutter/material.dart';

class HourlyList extends StatelessWidget {
  final List<dynamic>? hourly;

  const HourlyList({super.key, required this.hourly});

  @override
  Widget build(BuildContext context) {
    if (hourly == null || hourly!.isEmpty) return const SizedBox();

    return SizedBox(
      height: 140, // bounded height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourly!.length,
        itemBuilder: (context, i) {
          final h = hourly![i] ?? {};
          return Container(
            width: 100,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue.shade50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  h["time"]?.toString().split("T").last ?? "-",
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 6),
                Text(
                  "${h["temperature"]?.toString() ?? "-"}°C",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Hum: ${h["humidity"]?.toString() ?? "-"}%",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
