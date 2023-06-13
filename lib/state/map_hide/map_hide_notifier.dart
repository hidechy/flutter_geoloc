import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'map_hide_state.dart';

////////////////////////////////////////////////
final mapHideProvider =
    StateNotifierProvider.autoDispose<MapHideNotifier, MapHideState>((ref) {
  return MapHideNotifier(
    const MapHideState(),
  );
});

class MapHideNotifier extends StateNotifier<MapHideState> {
  MapHideNotifier(super.state);

  Future<void> setMapHide({required bool value}) async =>
      state = state.copyWith(mapHide: value);
}

////////////////////////////////////////////////
