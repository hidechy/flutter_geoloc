import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_lat_lng_request_state.freezed.dart';

@freezed
class PeriodLatLngRequestState with _$PeriodLatLngRequestState {
  const factory PeriodLatLngRequestState({
    @Default('') String flag,
    DateTime? date,
  }) = _PeriodLatLngRequestState;
}
