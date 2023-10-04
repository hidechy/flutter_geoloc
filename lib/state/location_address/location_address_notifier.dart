// ignore_for_file: avoid_dynamic_calls, avoid_catches_without_on_clauses, only_throw_errors

import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import '../../models/location_address.dart';
import 'location_address_request_state.dart';

//////////////////////////////////////////////////////

final locationAddressProvider = StateNotifierProvider.autoDispose
    .family<LocationAddressNotifier, LocationAddress, LocationAddressRequestState>((ref, param) {
  return LocationAddressNotifier(LocationAddress())..getLocationAddress(param: param);
});

class LocationAddressNotifier extends StateNotifier<LocationAddress> {
  LocationAddressNotifier(super.state);

  ///
  Future<void> getLocationAddress({required LocationAddressRequestState param}) async {
    try {
      final queryParameters = <String>[
        'method=searchByGeoLocation',
        'x=${param.longitude.substring(0, 7)}',
        'y=${param.latitude.substring(0, 6)}'
      ];

      final url = "https://geoapi.heartrails.com/api/json?${queryParameters.join('&')}";

      final response = await get(Uri.parse(url));

      final locationAddress = jsonDecode(response.body);

      if (locationAddress['response']['location'][0] != null) {
        state = LocationAddress(
          city: locationAddress['response']['location'][0]['city'] ?? '',
          cityKana: locationAddress['response']['location'][0]['city_kana'] ?? '',
          town: locationAddress['response']['location'][0]['town'] ?? '',
          townKana: locationAddress['response']['location'][0]['townkana'] ?? '',
          x: locationAddress['response']['location'][0]['x'] ?? '',
          y: locationAddress['response']['location'][0]['y'] ?? '',
          distance: locationAddress['response']['location'][0]['distance'] ?? 0,
          prefecture: locationAddress['response']['location'][0]['prefecture'] ?? '',
          postal: locationAddress['response']['location'][0]['postal'] ?? '',
        );
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

//////////////////////////////////////////////////////
