// ignore_for_file: avoid_dynamic_calls, avoid_catches_without_on_clauses, only_throw_errors

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import 'reverse_geo_request_state.dart';
import 'reverse_geo_response_state.dart';

//////////////////////////////////////////////////////

final reverseGeoProvider = StateNotifierProvider.autoDispose<ReverseGeoNotifier, ReverseGeoResponseState>((ref) {
  return ReverseGeoNotifier(const ReverseGeoResponseState());
});

class ReverseGeoNotifier extends StateNotifier<ReverseGeoResponseState> {
  ReverseGeoNotifier(super.state);

  ///
  Future<void> getReverseGeoState({required ReverseGeoRequestState param}) async {
    try {
      final queryParameters = <String>[
        'latlng=${param.latitude},${param.longitude}',
        'sensor=false',
        'language=ja',
        'key=${dotenv.get('GOOGLE_MAP_API_KEY')}'
      ];

      final url = "https://maps.google.com/maps/api/geocode/json?${queryParameters.join('&')}";

      final response = await get(Uri.parse(url));

      final reverseGeoData = jsonDecode(response.body) as Map<String, dynamic>;

      final reg = RegExp('日本');
      final reg2 = RegExp('-');

      final list = <String>[];
      for (var i = 0; i < reverseGeoData['results'][0]['address_components'].length; i++) {
        if (reg.firstMatch(reverseGeoData['results'][0]['address_components'][i]['long_name']) == null &&
            reg2.firstMatch(reverseGeoData['results'][0]['address_components'][i]['long_name']) == null) {
          list.add(reverseGeoData['results'][0]['address_components'][i]['long_name']);
        }
      }

      final list2 = <String>[];

      for (var i = list.length - 1; i > 0; i--) {
        list2.add(list[i]);
      }

      state = state.copyWith(addressComponentsNameList: list2);
    } catch (e) {
      throw e.toString();
    }
  }
}

//////////////////////////////////////////////////////
