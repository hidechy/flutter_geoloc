import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_pinpoint_state.freezed.dart';

@freezed
class MapPinpointState with _$MapPinpointState {
  const factory MapPinpointState({
    @Default('') String pinpointDate,
    @Default('') String pinpointTime,
    @Default(0) double pinpointLat,
    @Default(0) double pinpointLng,

    ///
    @Default(14) int pinpointMapZoom,
  }) = _MapPinpointState;
}
