class CampusModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  const CampusModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory CampusModel.fromJson(Map<String, dynamic> json) {
    return CampusModel(
      id: json['id'] as int,
      name: json['name'] as String,
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
    );
  }
}
