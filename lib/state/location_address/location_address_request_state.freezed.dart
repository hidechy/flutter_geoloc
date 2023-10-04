// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_address_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationAddressRequestState {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationAddressRequestStateCopyWith<LocationAddressRequestState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationAddressRequestStateCopyWith<$Res> {
  factory $LocationAddressRequestStateCopyWith(
          LocationAddressRequestState value,
          $Res Function(LocationAddressRequestState) then) =
      _$LocationAddressRequestStateCopyWithImpl<$Res,
          LocationAddressRequestState>;
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class _$LocationAddressRequestStateCopyWithImpl<$Res,
        $Val extends LocationAddressRequestState>
    implements $LocationAddressRequestStateCopyWith<$Res> {
  _$LocationAddressRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationAddressRequestStateCopyWith<$Res>
    implements $LocationAddressRequestStateCopyWith<$Res> {
  factory _$$_LocationAddressRequestStateCopyWith(
          _$_LocationAddressRequestState value,
          $Res Function(_$_LocationAddressRequestState) then) =
      __$$_LocationAddressRequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class __$$_LocationAddressRequestStateCopyWithImpl<$Res>
    extends _$LocationAddressRequestStateCopyWithImpl<$Res,
        _$_LocationAddressRequestState>
    implements _$$_LocationAddressRequestStateCopyWith<$Res> {
  __$$_LocationAddressRequestStateCopyWithImpl(
      _$_LocationAddressRequestState _value,
      $Res Function(_$_LocationAddressRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$_LocationAddressRequestState(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocationAddressRequestState implements _LocationAddressRequestState {
  const _$_LocationAddressRequestState(
      {this.latitude = '', this.longitude = ''});

  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String longitude;

  @override
  String toString() {
    return 'LocationAddressRequestState(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationAddressRequestState &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationAddressRequestStateCopyWith<_$_LocationAddressRequestState>
      get copyWith => __$$_LocationAddressRequestStateCopyWithImpl<
          _$_LocationAddressRequestState>(this, _$identity);
}

abstract class _LocationAddressRequestState
    implements LocationAddressRequestState {
  const factory _LocationAddressRequestState(
      {final String latitude,
      final String longitude}) = _$_LocationAddressRequestState;

  @override
  String get latitude;
  @override
  String get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_LocationAddressRequestStateCopyWith<_$_LocationAddressRequestState>
      get copyWith => throw _privateConstructorUsedError;
}
