class LatLng {
  LatLng({
    required this.latitude,
    required this.longitude,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
  String latitude;
  String longitude;

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
