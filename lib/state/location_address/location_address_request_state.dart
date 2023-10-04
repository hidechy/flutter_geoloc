import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_address_request_state.freezed.dart';

@freezed
class LocationAddressRequestState with _$LocationAddressRequestState {
  const factory LocationAddressRequestState({
    @Default('') String latitude,
    @Default('') String longitude,
  }) = _LocationAddressRequestState;
}
