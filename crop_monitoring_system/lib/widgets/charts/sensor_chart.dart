
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/sensor_data.dart';

class SensorChart extends StatelessWidget {
  final List<SensorData> sensorData;

  const SensorChart({
    Key? key,
    this.sensorData = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: sensorData.asMap().entries.map((entry) {
                return FlSpot(
                  entry.key.toDouble(),
                  entry.value.temperature,
                );
              }).toList(),
              isCurved: true,
              color: Colors.red,
              dotData: FlDotData(show: false),
            ),
            LineChartBarData(
              spots: sensorData.asMap().entries.map((entry) {
                return FlSpot(
                  entry.key.toDouble(),
                  entry.value.humidity,
                );
              }).toList(),
              isCurved: true,
              color: Colors.blue,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}