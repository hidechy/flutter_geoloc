// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_hide_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapHideState {
  bool get mapHide => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapHideStateCopyWith<MapHideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapHideStateCopyWith<$Res> {
  factory $MapHideStateCopyWith(
          MapHideState value, $Res Function(MapHideState) then) =
      _$MapHideStateCopyWithImpl<$Res, MapHideState>;
  @useResult
  $Res call({bool mapHide});
}

/// @nodoc
class _$MapHideStateCopyWithImpl<$Res, $Val extends MapHideState>
    implements $MapHideStateCopyWith<$Res> {
  _$MapHideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapHide = null,
  }) {
    return _then(_value.copyWith(
      mapHide: null == mapHide
          ? _value.mapHide
          : mapHide // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapHideStateCopyWith<$Res>
    implements $MapHideStateCopyWith<$Res> {
  factory _$$_MapHideStateCopyWith(
          _$_MapHideState value, $Res Function(_$_MapHideState) then) =
      __$$_MapHideStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool mapHide});
}

/// @nodoc
class __$$_MapHideStateCopyWithImpl<$Res>
    extends _$MapHideStateCopyWithImpl<$Res, _$_MapHideState>
    implements _$$_MapHideStateCopyWith<$Res> {
  __$$_MapHideStateCopyWithImpl(
      _$_MapHideState _value, $Res Function(_$_MapHideState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapHide = null,
  }) {
    return _then(_$_MapHideState(
      mapHide: null == mapHide
          ? _value.mapHide
          : mapHide // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MapHideState implements _MapHideState {
  const _$_MapHideState({this.mapHide = true});

  @override
  @JsonKey()
  final bool mapHide;

  @override
  String toString() {
    return 'MapHideState(mapHide: $mapHide)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapHideState &&
            (identical(other.mapHide, mapHide) || other.mapHide == mapHide));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mapHide);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapHideStateCopyWith<_$_MapHideState> get copyWith =>
      __$$_MapHideStateCopyWithImpl<_$_MapHideState>(this, _$identity);
}

abstract class _MapHideState implements MapHideState {
  const factory _MapHideState({final bool mapHide}) = _$_MapHideState;

  @override
  bool get mapHide;
  @override
  @JsonKey(ignore: true)
  _$$_MapHideStateCopyWith<_$_MapHideState> get copyWith =>
      throw _privateConstructorUsedError;
}
