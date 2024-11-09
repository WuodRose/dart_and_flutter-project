
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/charts/sensor_chart.dart';
import '../../widgets/charts/weather_chart.dart';
import 'weather_widget.dart';
import 'sensor_widget.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Get.toNamed('/settings'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherWidget(),
              SizedBox(height: 16),
              SensorWidget(),
              SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sensor Data Trends',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 16),
                      SensorChart(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Weather Forecast',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 16),
                      WeatherChart(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add-crop'),
        child: Icon(Icons.add),
        tooltip: 'Add Crop',
      ),
    );
  }
}
