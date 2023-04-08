import 'package:freezed_annotation/freezed_annotation.dart';

part 'geoloc_state.freezed.dart';

@freezed
class GeolocState with _$GeolocState {
  const factory GeolocState({
    DateTime? date,
    @Default('') String time,
    @Default('') String latitude,
    @Default('') String longitude,
  }) = _GeolocState;
}
