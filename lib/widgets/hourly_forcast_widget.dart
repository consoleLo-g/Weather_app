import 'package:flutter/material.dart';

class HourlyList extends StatelessWidget {
  final List<dynamic>? hourly;

  const HourlyList({super.key, required this.hourly});

  @override
  Widget build(BuildContext context) {
    if (hourly == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Hourly Forecast",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hourly!.length,
            itemBuilder: (context, i) {
              final h = hourly![i];
              return Container(
                width: 90,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.shade50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(h["time"], style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 6),
                    Text(
                      "${h["temp"]}°C",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(h["condition"], style: const TextStyle(fontSize: 12)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
