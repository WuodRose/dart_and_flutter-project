
class WeatherData {
  final double temperature;
  final double humidity;
  final double precipitation;
  final double windSpeed;
  final DateTime timestamp;

  WeatherData({
    required this.temperature,
    required this.humidity,
    required this.precipitation,
    required this.windSpeed,
    required this.timestamp,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['temp'].toDouble(),
      humidity: json['humidity'].toDouble(),
      precipitation: json['precipitation'].toDouble(),
      windSpeed: json['wind_speed'].toDouble(),
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}