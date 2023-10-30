import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_param_state.freezed.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    @Default(true) bool mapHide,
    @Default(0) int pinpointSpotNum,
    @Default(false) bool pinpointMapBoundsDisplay,
  }) = _AppParamState;
}
