import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_hide_state.freezed.dart';

@freezed
class MapHideState with _$MapHideState {
  const factory MapHideState({
    @Default(true) bool mapHide,
  }) = _MapHideState;
}
