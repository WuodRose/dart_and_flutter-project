
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/weather_data.dart';
import '../../services/api/weather_api_service.dart';

class WeatherForecastScreen extends StatelessWidget {
  final WeatherApiService _weatherService = WeatherApiService();
  final RxList<WeatherData> forecast = <WeatherData>[].obs;
  final RxBool isLoading = false.obs;

  Future<void> fetchWeatherForecast() async {
    isLoading.value = true;
    try {
      final data = await _weatherService.getWeatherForecast(0, 0); // Add coordinates
      // Process and update forecast data
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch weather forecast');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: fetchWeatherForecast,
          ),
        ],
      ),
      body: Obx(
        () => isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: forecast.length,
                itemBuilder: (context, index) {
                  final weather = forecast[index];
                  return _buildWeatherCard(weather);
                },
              ),
      ),
    );
  }

  Widget _buildWeatherCard(WeatherData weather) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Helpers.formatDate(weather.timestamp),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.thermostat, size: 20),
                      SizedBox(width: 4),
                      Text('${weather.temperature}°C'),
                      SizedBox(width: 16),
                      Icon(Icons.water_drop, size: 20),
                      SizedBox(width: 4),
                      Text('${weather.humidity}%'),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Icon(
                  Icons.wb_sunny,
                  size: 32,
                  color: Colors.orange,
                ),
                Text('${weather.precipitation}mm'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}