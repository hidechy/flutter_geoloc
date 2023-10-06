import 'package:freezed_annotation/freezed_annotation.dart';

part 'reverse_geo_response_state.freezed.dart';

@freezed
class ReverseGeoResponseState with _$ReverseGeoResponseState {
  const factory ReverseGeoResponseState({
    @Default([]) List<String> addressComponentsNameList,
  }) = _ReverseGeoResponseState;
}
