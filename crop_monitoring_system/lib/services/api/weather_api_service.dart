# lib/services/api/weather_api_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApiService {
  final String apiKey = 'your_openweathermap_api_key';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Map<String, dynamic>> getWeatherForecast(
    double lat,
    double lon,
  ) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/forecast?lat=$lat&lon=$lon&appid=$apiKey&units=metric'
      ),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather forecast');
    }
  }
}