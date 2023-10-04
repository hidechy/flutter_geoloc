import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'map_pinpoint_state.dart';

////////////////////////////////////////////////
final mapPinpointProvider = StateNotifierProvider.autoDispose<MapPinpointNotifier, MapPinpointState>((ref) {
  return MapPinpointNotifier(const MapPinpointState());
});

class MapPinpointNotifier extends StateNotifier<MapPinpointState> {
  MapPinpointNotifier(super.state);

  ///
  Future<void> setPinpointLatLng({
    required String date,
    required String time,
    required double lat,
    required double lng,
  }) async =>
      state = state.copyWith(
        pinpointDate: date,
        pinpointTime: time,
        pinpointLat: lat,
        pinpointLng: lng,
      );

  ///
  Future<void> setPinpointMapZoom({required int zoom}) async => state = state.copyWith(pinpointMapZoom: zoom);
}

////////////////////////////////////////////////
