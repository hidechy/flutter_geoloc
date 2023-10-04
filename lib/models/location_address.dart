import '../extensions/extensions.dart';

class LocationAddress {
  LocationAddress({
    this.city = '',
    this.cityKana = '',
    this.town = '',
    this.townKana = '',
    this.x = '',
    this.y = '',
    this.distance = 0,
    this.prefecture = '',
    this.postal = '',
  });

  factory LocationAddress.fromJson(Map<String, dynamic> json) => LocationAddress(
        city: json['city'].toString(),
        cityKana: json['city_kana'].toString(),
        town: json['town'].toString(),
        townKana: json['town_kana'].toString(),
        x: json['x'].toString(),
        y: json['y'].toString(),
        distance: json['distance'].toString().toDouble(),
        prefecture: json['prefecture'].toString(),
        postal: json['postal'].toString(),
      );

  String city;
  String cityKana;
  String town;
  String townKana;
  String x;
  String y;
  double distance;
  String prefecture;
  String postal;

  Map<String, dynamic> toJson() => {
        'city': city,
        'city_kana': cityKana,
        'town': town,
        'town_kana': townKana,
        'x': x,
        'y': y,
        'distance': distance,
        'prefecture': prefecture,
        'postal': postal,
      };
}
