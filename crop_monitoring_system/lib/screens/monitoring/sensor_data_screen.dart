import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SensorDataScreen extends StatelessWidget {
  const SensorDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor Data'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SensorCard(
              title: 'Soil Moisture',
              value: '65%',
              icon: Icons.water_drop,
              color: Colors.blue,
            ),
            const SensorCard(
              title: 'Temperature',
              value: '25°C',
              icon: Icons.thermostat,
              color: Colors.orange,
            ),
            const SensorCard(
              title: 'Humidity',
              value: '70%',
              icon: Icons.cloud,
              color: Colors.purple,
            ),
            const SensorCard(
              title: 'Light Intensity',
              value: '80%',
              icon: Icons.light_mode,
              color: Colors.yellow,
            ),
            const SizedBox(height: 16),
            Text(
              'Recent History',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Reading ${10 - index}'),
                    subtitle: Text('2024-03-${10 - index}'),
                    trailing: const Text('Normal'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SensorCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const SensorCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(value, style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}