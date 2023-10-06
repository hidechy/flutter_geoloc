// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

/*

https://maps.google.com/maps/api/geocode/json?latlng=35.71384,139.943899&sensor=false&language=ja&key=

https://maps.google.com/maps/api/geocode/json
?latlng=35.71384,139.943899
&sensor=false
&language=ja
&key=

*/

import 'dart:convert';

ReverseGeo getReverseGeoFromJson(String str) => ReverseGeo.fromJson(json.decode(str));

String getReverseGeoToJson(ReverseGeo data) => json.encode(data.toJson());

///
class ReverseGeo {
  ReverseGeo({required this.plusCode, required this.results, required this.status});

  factory ReverseGeo.fromJson(Map<String, dynamic> json) => ReverseGeo(
        plusCode: PlusCode.fromJson(json['plus_code']),
        results: List<Result>.from(json['results'].map(Result.fromJson)),
        status: json['status'],
      );

  PlusCode plusCode;
  List<Result> results;
  String status;

  Map<String, dynamic> toJson() => {
        'plus_code': plusCode.toJson(),
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
        'status': status,
      };
}

///
class PlusCode {
  PlusCode({required this.compoundCode, required this.globalCode});

  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return PlusCode(compoundCode: json['compound_code'], globalCode: json['global_code']);
  }

  String compoundCode;
  String globalCode;

  Map<String, dynamic> toJson() => {'compound_code': compoundCode, 'global_code': globalCode};
}

///
class Result {
  Result({
    required this.addressComponents,
    required this.formattedAddress,
    required this.geometry,
    required this.placeId,
    required this.plusCode,
    required this.types,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: List<AddressComponent>.from(json['address_components'].map(AddressComponent.fromJson)),
        formattedAddress: json['formatted_address'],
        geometry: Geometry.fromJson(json['geometry']),
        placeId: json['place_id'],
        plusCode: PlusCode.fromJson(json['plus_code']),
        types: List<String>.from(json['types'].map((x) => x)),
      );

  List<AddressComponent> addressComponents;
  String formattedAddress;
  Geometry geometry;
  String placeId;
  PlusCode plusCode;
  List<String> types;

  Map<String, dynamic> toJson() => {
        'address_components': List<dynamic>.from(addressComponents.map((x) => x.toJson())),
        'formatted_address': formattedAddress,
        'geometry': geometry.toJson(),
        'place_id': placeId,
        'plus_code': plusCode.toJson(),
        'types': List<dynamic>.from(types.map((x) => x)),
      };
}

///
class AddressComponent {
  AddressComponent({required this.longName, required this.shortName, required this.types});

  factory AddressComponent.fromJson(Map<String, dynamic> json) => AddressComponent(
        longName: json['long_name'],
        shortName: json['short_name'],
        types: List<String>.from(json['types'].map((x) => x)),
      );

  String longName;
  String shortName;
  List<String> types;

  Map<String, dynamic> toJson() => {
        'long_name': longName,
        'short_name': shortName,
        'types': List<dynamic>.from(types.map((x) => x)),
      };
}

///
class Geometry {
  Geometry({required this.location, required this.locationType, required this.viewport, required this.bounds});

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json['location']),
        locationType: json['location_type'],
        viewport: Viewport.fromJson(json['viewport']),
        bounds: Viewport.fromJson(json['bounds']),
      );

  Location location;
  String locationType;
  Viewport viewport;
  Viewport bounds;

  Map<String, dynamic> toJson() => {
        'location': location.toJson(),
        'location_type': locationType,
        'viewport': viewport.toJson(),
        'bounds': bounds.toJson(),
      };
}

///
class Viewport {
  Viewport({required this.northeast, required this.southwest});

  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(northeast: Location.fromJson(json['northeast']), southwest: Location.fromJson(json['southwest']));
  }

  Location northeast;
  Location southwest;

  Map<String, dynamic> toJson() => {'northeast': northeast.toJson(), 'southwest': southwest.toJson()};
}

///
class Location {
  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(lat: json['lat']?.toDouble(), lng: json['lng']?.toDouble());
  }

  double lat;
  double lng;

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

/*

{
"plus_code": {
"compound_code": "PW7V+GHJ 日本、千葉県船橋市",
"global_code": "8Q7XPW7V+GHJ"
},
"results": [
{
"address_components": [
{
"long_name": "３９０番１",
"short_name": "３９０番１",
"types": [
"premise"
]
},
{
"long_name": "１７",
"short_name": "１７",
"types": [
"political",
"sublocality",
"sublocality_level_4"
]
},
{
"long_name": "２丁目",
"short_name": "２丁目",
"types": [
"political",
"sublocality",
"sublocality_level_3"
]
},
{
"long_name": "本中山",
"short_name": "本中山",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
},
{
"long_name": "273-0035",
"short_name": "273-0035",
"types": [
"postal_code"
]
}
],
"formatted_address": "日本、〒273-0035 千葉県船橋市本中山２丁目１７−３９０番１ 下総中山駅高架下",
"geometry": {
"location": {
"lat": 35.71383950000001,
"lng": 139.9439684
},
"location_type": "ROOFTOP",
"viewport": {
"northeast": {
"lat": 35.71518848029151,
"lng": 139.9453173802915
},
"southwest": {
"lat": 35.71249051970851,
"lng": 139.9426194197085
}
}
},
"place_id": "ChIJ3YwN5OqBGGAResYEQfAMgrI",
"plus_code": {
"compound_code": "PW7V+GH 日本、千葉県船橋市",
"global_code": "8Q7XPW7V+GH"
},
"types": [
"establishment",
"food",
"furniture_store",
"home_goods_store",
"point_of_interest",
"store"
]
},
{
"address_components": [
{
"long_name": "１３",
"short_name": "１３",
"types": [
"premise"
]
},
{
"long_name": "１１",
"short_name": "１１",
"types": [
"political",
"sublocality",
"sublocality_level_4"
]
},
{
"long_name": "３丁目",
"short_name": "３丁目",
"types": [
"political",
"sublocality",
"sublocality_level_3"
]
},
{
"long_name": "本中山",
"short_name": "本中山",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
},
{
"long_name": "273-0035",
"short_name": "273-0035",
"types": [
"postal_code"
]
}
],
"formatted_address": "日本、〒273-0035 千葉県船橋市本中山３丁目１１−１３",
"geometry": {
"bounds": {
"northeast": {
"lat": 35.713817,
"lng": 139.9438552
},
"southwest": {
"lat": 35.7137067,
"lng": 139.9437424
}
},
"location": {
"lat": 35.7137462,
"lng": 139.943799
},
"location_type": "ROOFTOP",
"viewport": {
"northeast": {
"lat": 35.7151108302915,
"lng": 139.9451477802915
},
"southwest": {
"lat": 35.7124128697085,
"lng": 139.9424498197085
}
}
},
"place_id": "ChIJWa2QBdGAGGARItXiwm4_bpo",
"types": [
"premise"
]
},
{
"address_components": [
{
"long_name": "３６８−７",
"short_name": "３６８−７",
"types": [
"premise"
]
},
{
"long_name": "１４",
"short_name": "１４",
"types": [
"political",
"sublocality",
"sublocality_level_4"
]
},
{
"long_name": "３丁目",
"short_name": "３丁目",
"types": [
"political",
"sublocality",
"sublocality_level_3"
]
},
{
"long_name": "本中山",
"short_name": "本中山",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
},
{
"long_name": "273-0035",
"short_name": "273-0035",
"types": [
"postal_code"
]
}
],
"formatted_address": "日本、〒273-0035 千葉県船橋市本中山３丁目１４−３６８−７",
"geometry": {
"location": {
"lat": 35.71384219999999,
"lng": 139.9436583
},
"location_type": "ROOFTOP",
"viewport": {
"northeast": {
"lat": 35.71519118029149,
"lng": 139.9450072802915
},
"southwest": {
"lat": 35.7124932197085,
"lng": 139.9423093197085
}
}
},
"place_id": "ChIJEyXDD9GAGGARjqgfm_0letE",
"plus_code": {
"compound_code": "PW7V+GF 日本、千葉県船橋市",
"global_code": "8Q7XPW7V+GF"
},
"types": [
"street_address"
]
},
{
"address_components": [
{
"long_name": "下総中山駅",
"short_name": "下総中山駅",
"types": [
"establishment",
"point_of_interest",
"train_station",
"transit_station"
]
},
{
"long_name": "１７",
"short_name": "１７",
"types": [
"political",
"sublocality",
"sublocality_level_4"
]
},
{
"long_name": "２丁目",
"short_name": "２丁目",
"types": [
"political",
"sublocality",
"sublocality_level_3"
]
},
{
"long_name": "本中山",
"short_name": "本中山",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
},
{
"long_name": "273-0035",
"short_name": "273-0035",
"types": [
"postal_code"
]
}
],
"formatted_address": "日本、〒273-0035 千葉県船橋市本中山２丁目１７ 下総中山駅",
"geometry": {
"location": {
"lat": 35.7143133,
"lng": 139.9430576
},
"location_type": "GEOMETRIC_CENTER",
"viewport": {
"northeast": {
"lat": 35.7156622802915,
"lng": 139.9444065802915
},
"southwest": {
"lat": 35.7129643197085,
"lng": 139.9417086197085
}
}
},
"place_id": "ChIJ92sIQNGAGGARkgHjrZXUu2w",
"plus_code": {
"compound_code": "PW7V+P6 日本、千葉県船橋市",
"global_code": "8Q7XPW7V+P6"
},
"types": [
"establishment",
"point_of_interest",
"train_station",
"transit_station"
]
},
{
"address_components": [
{
"long_name": "PW7V+GH",
"short_name": "PW7V+GH",
"types": [
"plus_code"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
}
],
"formatted_address": "PW7V+GH 日本、千葉県船橋市",
"geometry": {
"bounds": {
"northeast": {
"lat": 35.713875,
"lng": 139.944
},
"southwest": {
"lat": 35.71375,
"lng": 139.943875
}
},
"location": {
"lat": 35.71384,
"lng": 139.943899
},
"location_type": "GEOMETRIC_CENTER",
"viewport": {
"northeast": {
"lat": 35.71516148029151,
"lng": 139.9452864802915
},
"southwest": {
"lat": 35.71246351970851,
"lng": 139.9425885197085
}
}
},
"place_id": "GhIJz0nvG1_bQUARRPesazR-YUA",
"plus_code": {
"compound_code": "PW7V+GH 日本、千葉県船橋市",
"global_code": "8Q7XPW7V+GH"
},
"types": [
"plus_code"
]
},
{
"address_components": [
{
"long_name": "道路",
"short_name": "道路",
"types": [
"route"
]
},
{
"long_name": "１７",
"short_name": "１７",
"types": [
"political",
"sublocality",
"sublocality_level_4"
]
},
{
"long_name": "２丁目",
"short_name": "２丁目",
"types": [
"political",
"sublocality",
"sublocality_level_3"
]
},
{
"long_name": "本中山",
"short_name": "本中山",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
},
{
"long_name": "273-0035",
"short_name": "273-0035",
"types": [
"postal_code"
]
}
],
"formatted_address": "日本、〒273-0035 千葉県船橋市本中山２丁目１７ 道路",
"geometry": {
"bounds": {
"northeast": {
"lat": 35.7141062,
"lng": 139.9444149
},
"southwest": {
"lat": 35.7136265,
"lng": 139.943228
}
},
"location": {
"lat": 35.7138719,
"lng": 139.9438248
},
"location_type": "GEOMETRIC_CENTER",
"viewport": {
"northeast": {
"lat": 35.7152153302915,
"lng": 139.9451704302915
},
"southwest": {
"lat": 35.7125173697085,
"lng": 139.9424724697085
}
}
},
"place_id": "ChIJz4U5FdGAGGARAiPpjQrdmT8",
"types": [
"route"
]
},
{
"address_components": [
{
"long_name": "１７",
"short_name": "１７",
"types": [
"political",
"sublocality",
"sublocality_level_4"
]
},
{
"long_name": "２丁目",
"short_name": "２丁目",
"types": [
"political",
"sublocality",
"sublocality_level_3"
]
},
{
"long_name": "本中山",
"short_name": "本中山",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
},
{
"long_name": "273-0035",
"short_name": "273-0035",
"types": [
"postal_code"
]
}
],
"formatted_address": "日本、〒273-0035 千葉県船橋市本中山２丁目１７",
"geometry": {
"bounds": {
"northeast": {
"lat": 35.71507220000001,
"lng": 139.9455523
},
"southwest": {
"lat": 35.7132656,
"lng": 139.9415534
}
},
"location": {
"lat": 35.7146062,
"lng": 139.9429378
},
"location_type": "GEOMETRIC_CENTER",
"viewport": {
"northeast": {
"lat": 35.7155178802915,
"lng": 139.9455523
},
"southwest": {
"lat": 35.7128199197085,
"lng": 139.9415534
}
}
},
"place_id": "ChIJ8-TZFtGAGGAR5qbH_BmK0-8",
"types": [
"political",
"sublocality",
"sublocality_level_4"
]
},
{
"address_components": [
{
"long_name": "２丁目",
"short_name": "２丁目",
"types": [
"political",
"sublocality",
"sublocality_level_3"
]
},
{
"long_name": "本中山",
"short_name": "本中山",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
},
{
"long_name": "273-0035",
"short_name": "273-0035",
"types": [
"postal_code"
]
}
],
"formatted_address": "日本、〒273-0035 千葉県船橋市本中山２丁目",
"geometry": {
"bounds": {
"northeast": {
"lat": 35.716435,
"lng": 139.9481789
},
"southwest": {
"lat": 35.7128299,
"lng": 139.9415534
}
},
"location": {
"lat": 35.7150691,
"lng": 139.9437389
},
"location_type": "APPROXIMATE",
"viewport": {
"northeast": {
"lat": 35.716435,
"lng": 139.9481789
},
"southwest": {
"lat": 35.7128299,
"lng": 139.9415534
}
}
},
"place_id": "ChIJGwXL5dCAGGARl3EM1oG_NXc",
"types": [
"political",
"sublocality",
"sublocality_level_3"
]
},
{
"address_components": [
{
"long_name": "273-0035",
"short_name": "273-0035",
"types": [
"postal_code"
]
},
{
"long_name": "本中山",
"short_name": "本中山",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
}
],
"formatted_address": "日本 〒273-0035",
"geometry": {
"bounds": {
"northeast": {
"lat": 35.7191818,
"lng": 139.9499342
},
"southwest": {
"lat": 35.7018418,
"lng": 139.9388689
}
},
"location": {
"lat": 35.7096418,
"lng": 139.943098
},
"location_type": "APPROXIMATE",
"viewport": {
"northeast": {
"lat": 35.7191818,
"lng": 139.9499342
},
"southwest": {
"lat": 35.7018418,
"lng": 139.9388689
}
}
},
"place_id": "ChIJSSW2K9eAGGARWe_VRXsP4eg",
"types": [
"postal_code"
]
},
{
"address_components": [
{
"long_name": "本中山",
"short_name": "本中山",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
},
{
"long_name": "273-0035",
"short_name": "273-0035",
"types": [
"postal_code"
]
}
],
"formatted_address": "日本、〒273-0035 千葉県船橋市本中山",
"geometry": {
"bounds": {
"northeast": {
"lat": 35.7191818,
"lng": 139.9499342
},
"southwest": {
"lat": 35.7018418,
"lng": 139.9388689
}
},
"location": {
"lat": 35.7096418,
"lng": 139.943098
},
"location_type": "APPROXIMATE",
"viewport": {
"northeast": {
"lat": 35.7191818,
"lng": 139.9499342
},
"southwest": {
"lat": 35.7018418,
"lng": 139.9388689
}
}
},
"place_id": "ChIJPXAsy8-AGGAR6WHhCDdAlSg",
"types": [
"political",
"sublocality",
"sublocality_level_2"
]
},
{
"address_components": [
{
"long_name": "船橋市",
"short_name": "船橋市",
"types": [
"locality",
"political"
]
},
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
}
],
"formatted_address": "日本、千葉県船橋市",
"geometry": {
"bounds": {
"northeast": {
"lat": 35.7995317,
"lng": 140.0895288
},
"southwest": {
"lat": 35.6638334,
"lng": 139.9388689
}
},
"location": {
"lat": 35.6945485,
"lng": 139.9827277
},
"location_type": "APPROXIMATE",
"viewport": {
"northeast": {
"lat": 35.7995317,
"lng": 140.0895288
},
"southwest": {
"lat": 35.6638334,
"lng": 139.9388689
}
}
},
"place_id": "ChIJt15MhSGAGGARCWuHCkC7KIE",
"types": [
"locality",
"political"
]
},
{
"address_components": [
{
"long_name": "千葉県",
"short_name": "千葉県",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
}
],
"formatted_address": "日本、千葉県",
"geometry": {
"bounds": {
"northeast": {
"lat": 36.1040901,
"lng": 140.8789636
},
"southwest": {
"lat": 34.8979627,
"lng": 139.7393896
}
},
"location": {
"lat": 35.3354155,
"lng": 140.1832516
},
"location_type": "APPROXIMATE",
"viewport": {
"northeast": {
"lat": 36.1040901,
"lng": 140.8789636
},
"southwest": {
"lat": 34.8979627,
"lng": 139.7393896
}
}
},
"place_id": "ChIJEZUb1l-bImARvnvg_9t3thw",
"types": [
"administrative_area_level_1",
"political"
]
},
{
"address_components": [
{
"long_name": "日本",
"short_name": "JP",
"types": [
"country",
"political"
]
}
],
"formatted_address": "日本",
"geometry": {
"bounds": {
"northeast": {
"lat": 45.6412626,
"lng": 154.0031455
},
"southwest": {
"lat": 20.3585295,
"lng": 122.8554688
}
},
"location": {
"lat": 36.204824,
"lng": 138.252924
},
"location_type": "APPROXIMATE",
"viewport": {
"northeast": {
"lat": 45.6412626,
"lng": 154.0031455
},
"southwest": {
"lat": 20.3585295,
"lng": 122.8554688
}
}
},
"place_id": "ChIJLxl_1w9OZzQRRFJmfNR1QvU",
"types": [
"country",
"political"
]
}
],
"status": "OK"
}

*/
