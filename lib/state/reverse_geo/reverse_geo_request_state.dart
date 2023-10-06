import 'package:freezed_annotation/freezed_annotation.dart';

part 'reverse_geo_request_state.freezed.dart';

@freezed
class ReverseGeoRequestState with _$ReverseGeoRequestState {
  const factory ReverseGeoRequestState({
    @Default('') String latitude,
    @Default('') String longitude,
  }) = _ReverseGeoRequestState;
}
