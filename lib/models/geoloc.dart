/*
http://toyohide.work/BrainLog/api/getGeoloc
{"date":"2023-01-01"}

{
    "data": [
        {
            "date": "2023-04-13",
            "time": "23:57:34",
            "latitude": "35.7098248",
            "longitude": "139.9492624"
        },

*/

class Geoloc {
  Geoloc({
    required this.date,
    required this.time,
    required this.latitude,
    required this.longitude,
  });

  factory Geoloc.fromJson(Map<String, dynamic> json) => Geoloc(
        date: DateTime.parse(json['date'].toString()),
        time: json['time'].toString(),
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
      );

  DateTime date;
  String time;
  String latitude;
  String longitude;

  Map<String, dynamic> toJson() => {
        'date':
            '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
        'time': time,
        'latitude': latitude,
        'longitude': longitude,
      };
}
