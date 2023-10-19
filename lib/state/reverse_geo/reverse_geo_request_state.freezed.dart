// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reverse_geo_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReverseGeoRequestState {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReverseGeoRequestStateCopyWith<ReverseGeoRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeoRequestStateCopyWith<$Res> {
  factory $ReverseGeoRequestStateCopyWith(ReverseGeoRequestState value,
          $Res Function(ReverseGeoRequestState) then) =
      _$ReverseGeoRequestStateCopyWithImpl<$Res, ReverseGeoRequestState>;
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class _$ReverseGeoRequestStateCopyWithImpl<$Res,
        $Val extends ReverseGeoRequestState>
    implements $ReverseGeoRequestStateCopyWith<$Res> {
  _$ReverseGeoRequestStateCopyWithImpl(this._value, this._then);

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
abstract class _$$ReverseGeoRequestStateImplCopyWith<$Res>
    implements $ReverseGeoRequestStateCopyWith<$Res> {
  factory _$$ReverseGeoRequestStateImplCopyWith(
          _$ReverseGeoRequestStateImpl value,
          $Res Function(_$ReverseGeoRequestStateImpl) then) =
      __$$ReverseGeoRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class __$$ReverseGeoRequestStateImplCopyWithImpl<$Res>
    extends _$ReverseGeoRequestStateCopyWithImpl<$Res,
        _$ReverseGeoRequestStateImpl>
    implements _$$ReverseGeoRequestStateImplCopyWith<$Res> {
  __$$ReverseGeoRequestStateImplCopyWithImpl(
      _$ReverseGeoRequestStateImpl _value,
      $Res Function(_$ReverseGeoRequestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$ReverseGeoRequestStateImpl(
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

class _$ReverseGeoRequestStateImpl implements _ReverseGeoRequestState {
  const _$ReverseGeoRequestStateImpl({this.latitude = '', this.longitude = ''});

  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String longitude;

  @override
  String toString() {
    return 'ReverseGeoRequestState(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeoRequestStateImpl &&
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
  _$$ReverseGeoRequestStateImplCopyWith<_$ReverseGeoRequestStateImpl>
      get copyWith => __$$ReverseGeoRequestStateImplCopyWithImpl<
          _$ReverseGeoRequestStateImpl>(this, _$identity);
}

abstract class _ReverseGeoRequestState implements ReverseGeoRequestState {
  const factory _ReverseGeoRequestState(
      {final String latitude,
      final String longitude}) = _$ReverseGeoRequestStateImpl;

  @override
  String get latitude;
  @override
  String get longitude;
  @override
  @JsonKey(ignore: true)
  _$$ReverseGeoRequestStateImplCopyWith<_$ReverseGeoRequestStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
