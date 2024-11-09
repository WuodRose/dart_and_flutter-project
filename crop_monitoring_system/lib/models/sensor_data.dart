
class SensorData {
  final int id;
  final int fieldId;
  final double temperature;
  final double humidity;
  final double soilMoisture;
  final int lightIntensity;
  final DateTime timestamp;

  SensorData({
    required this.id,
    required this.fieldId,
    required this.temperature,
    required this.humidity,
    required this.soilMoisture,
    required this.lightIntensity,
    required this.timestamp,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      id: json['id'],
      fieldId: json['field_id'],
      temperature: json['temperature'].toDouble(),
      humidity: json['humidity'].toDouble(),
      soilMoisture: json['soil_moisture'].toDouble(),
      lightIntensity: json['light_intensity'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
