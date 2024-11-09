
class Crop {
  final int id;
  final int fieldId;
  final String name;
  final String variety;
  final DateTime plantingDate;
  final DateTime expectedHarvestDate;
  final String status;

  Crop({
    required this.id,
    required this.fieldId,
    required this.name,
    required this.variety,
    required this.plantingDate,
    required this.expectedHarvestDate,
    required this.status,
  });

  factory Crop.fromJson(Map<String, dynamic> json) {
    return Crop(
      id: json['id'],
      fieldId: json['field_id'],
      name: json['name'],
      variety: json['variety'],
      plantingDate: DateTime.parse(json['planting_date']),
      expectedHarvestDate: DateTime.parse(json['expected_harvest_date']),
      status: json['status'],
    );
  }
}