// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_pinpoint_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapPinpointState {
  String get pinpointDate => throw _privateConstructorUsedError;
  String get pinpointTime => throw _privateConstructorUsedError;
  double get pinpointLat => throw _privateConstructorUsedError;
  double get pinpointLng => throw _privateConstructorUsedError;

  ///
  int get pinpointMapZoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapPinpointStateCopyWith<MapPinpointState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapPinpointStateCopyWith<$Res> {
  factory $MapPinpointStateCopyWith(
          MapPinpointState value, $Res Function(MapPinpointState) then) =
      _$MapPinpointStateCopyWithImpl<$Res, MapPinpointState>;
  @useResult
  $Res call(
      {String pinpointDate,
      String pinpointTime,
      double pinpointLat,
      double pinpointLng,
      int pinpointMapZoom});
}

/// @nodoc
class _$MapPinpointStateCopyWithImpl<$Res, $Val extends MapPinpointState>
    implements $MapPinpointStateCopyWith<$Res> {
  _$MapPinpointStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinpointDate = null,
    Object? pinpointTime = null,
    Object? pinpointLat = null,
    Object? pinpointLng = null,
    Object? pinpointMapZoom = null,
  }) {
    return _then(_value.copyWith(
      pinpointDate: null == pinpointDate
          ? _value.pinpointDate
          : pinpointDate // ignore: cast_nullable_to_non_nullable
              as String,
      pinpointTime: null == pinpointTime
          ? _value.pinpointTime
          : pinpointTime // ignore: cast_nullable_to_non_nullable
              as String,
      pinpointLat: null == pinpointLat
          ? _value.pinpointLat
          : pinpointLat // ignore: cast_nullable_to_non_nullable
              as double,
      pinpointLng: null == pinpointLng
          ? _value.pinpointLng
          : pinpointLng // ignore: cast_nullable_to_non_nullable
              as double,
      pinpointMapZoom: null == pinpointMapZoom
          ? _value.pinpointMapZoom
          : pinpointMapZoom // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapPinpointStateImplCopyWith<$Res>
    implements $MapPinpointStateCopyWith<$Res> {
  factory _$$MapPinpointStateImplCopyWith(_$MapPinpointStateImpl value,
          $Res Function(_$MapPinpointStateImpl) then) =
      __$$MapPinpointStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pinpointDate,
      String pinpointTime,
      double pinpointLat,
      double pinpointLng,
      int pinpointMapZoom});
}

/// @nodoc
class __$$MapPinpointStateImplCopyWithImpl<$Res>
    extends _$MapPinpointStateCopyWithImpl<$Res, _$MapPinpointStateImpl>
    implements _$$MapPinpointStateImplCopyWith<$Res> {
  __$$MapPinpointStateImplCopyWithImpl(_$MapPinpointStateImpl _value,
      $Res Function(_$MapPinpointStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinpointDate = null,
    Object? pinpointTime = null,
    Object? pinpointLat = null,
    Object? pinpointLng = null,
    Object? pinpointMapZoom = null,
  }) {
    return _then(_$MapPinpointStateImpl(
      pinpointDate: null == pinpointDate
          ? _value.pinpointDate
          : pinpointDate // ignore: cast_nullable_to_non_nullable
              as String,
      pinpointTime: null == pinpointTime
          ? _value.pinpointTime
          : pinpointTime // ignore: cast_nullable_to_non_nullable
              as String,
      pinpointLat: null == pinpointLat
          ? _value.pinpointLat
          : pinpointLat // ignore: cast_nullable_to_non_nullable
              as double,
      pinpointLng: null == pinpointLng
          ? _value.pinpointLng
          : pinpointLng // ignore: cast_nullable_to_non_nullable
              as double,
      pinpointMapZoom: null == pinpointMapZoom
          ? _value.pinpointMapZoom
          : pinpointMapZoom // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MapPinpointStateImpl implements _MapPinpointState {
  const _$MapPinpointStateImpl(
      {this.pinpointDate = '',
      this.pinpointTime = '',
      this.pinpointLat = 0,
      this.pinpointLng = 0,
      this.pinpointMapZoom = 14});

  @override
  @JsonKey()
  final String pinpointDate;
  @override
  @JsonKey()
  final String pinpointTime;
  @override
  @JsonKey()
  final double pinpointLat;
  @override
  @JsonKey()
  final double pinpointLng;

  ///
  @override
  @JsonKey()
  final int pinpointMapZoom;

  @override
  String toString() {
    return 'MapPinpointState(pinpointDate: $pinpointDate, pinpointTime: $pinpointTime, pinpointLat: $pinpointLat, pinpointLng: $pinpointLng, pinpointMapZoom: $pinpointMapZoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapPinpointStateImpl &&
            (identical(other.pinpointDate, pinpointDate) ||
                other.pinpointDate == pinpointDate) &&
            (identical(other.pinpointTime, pinpointTime) ||
                other.pinpointTime == pinpointTime) &&
            (identical(other.pinpointLat, pinpointLat) ||
                other.pinpointLat == pinpointLat) &&
            (identical(other.pinpointLng, pinpointLng) ||
                other.pinpointLng == pinpointLng) &&
            (identical(other.pinpointMapZoom, pinpointMapZoom) ||
                other.pinpointMapZoom == pinpointMapZoom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pinpointDate, pinpointTime,
      pinpointLat, pinpointLng, pinpointMapZoom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapPinpointStateImplCopyWith<_$MapPinpointStateImpl> get copyWith =>
      __$$MapPinpointStateImplCopyWithImpl<_$MapPinpointStateImpl>(
          this, _$identity);
}

abstract class _MapPinpointState implements MapPinpointState {
  const factory _MapPinpointState(
      {final String pinpointDate,
      final String pinpointTime,
      final double pinpointLat,
      final double pinpointLng,
      final int pinpointMapZoom}) = _$MapPinpointStateImpl;

  @override
  String get pinpointDate;
  @override
  String get pinpointTime;
  @override
  double get pinpointLat;
  @override
  double get pinpointLng;
  @override

  ///
  int get pinpointMapZoom;
  @override
  @JsonKey(ignore: true)
  _$$MapPinpointStateImplCopyWith<_$MapPinpointStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
