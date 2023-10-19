// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geoloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GeolocState {
  DateTime? get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeolocStateCopyWith<GeolocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeolocStateCopyWith<$Res> {
  factory $GeolocStateCopyWith(
          GeolocState value, $Res Function(GeolocState) then) =
      _$GeolocStateCopyWithImpl<$Res, GeolocState>;
  @useResult
  $Res call({DateTime? date, String time, String latitude, String longitude});
}

/// @nodoc
class _$GeolocStateCopyWithImpl<$Res, $Val extends GeolocState>
    implements $GeolocStateCopyWith<$Res> {
  _$GeolocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? time = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$GeolocStateImplCopyWith<$Res>
    implements $GeolocStateCopyWith<$Res> {
  factory _$$GeolocStateImplCopyWith(
          _$GeolocStateImpl value, $Res Function(_$GeolocStateImpl) then) =
      __$$GeolocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, String time, String latitude, String longitude});
}

/// @nodoc
class __$$GeolocStateImplCopyWithImpl<$Res>
    extends _$GeolocStateCopyWithImpl<$Res, _$GeolocStateImpl>
    implements _$$GeolocStateImplCopyWith<$Res> {
  __$$GeolocStateImplCopyWithImpl(
      _$GeolocStateImpl _value, $Res Function(_$GeolocStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? time = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$GeolocStateImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$GeolocStateImpl implements _GeolocState {
  const _$GeolocStateImpl(
      {this.date, this.time = '', this.latitude = '', this.longitude = ''});

  @override
  final DateTime? date;
  @override
  @JsonKey()
  final String time;
  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String longitude;

  @override
  String toString() {
    return 'GeolocState(date: $date, time: $time, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeolocStateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, time, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeolocStateImplCopyWith<_$GeolocStateImpl> get copyWith =>
      __$$GeolocStateImplCopyWithImpl<_$GeolocStateImpl>(this, _$identity);
}

abstract class _GeolocState implements GeolocState {
  const factory _GeolocState(
      {final DateTime? date,
      final String time,
      final String latitude,
      final String longitude}) = _$GeolocStateImpl;

  @override
  DateTime? get date;
  @override
  String get time;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  @JsonKey(ignore: true)
  _$$GeolocStateImplCopyWith<_$GeolocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
