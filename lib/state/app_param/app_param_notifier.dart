import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_param_state.dart';

////////////////////////////////////////////////
final appParamProvider = StateNotifierProvider.autoDispose<AppParamNotifier, AppParamState>((ref) {
  return AppParamNotifier(const AppParamState());
});

class AppParamNotifier extends StateNotifier<AppParamState> {
  AppParamNotifier(super.state);

  ///
  Future<void> setMapHide({required bool value}) async => state = state.copyWith(mapHide: value);

  ///
  Future<void> setPinpointSpotNum({required int value}) async => state = state.copyWith(pinpointSpotNum: value);

  ///
  Future<void> setPinpointMapBoundsDisplay({required bool value}) async =>
      state = state.copyWith(pinpointMapBoundsDisplay: value);
}

////////////////////////////////////////////////
