// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_param_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppParamState {
  bool get mapHide => throw _privateConstructorUsedError;
  int get pinpointSpotNum => throw _privateConstructorUsedError;
  bool get pinpointMapBoundsDisplay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppParamStateCopyWith<AppParamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppParamStateCopyWith<$Res> {
  factory $AppParamStateCopyWith(
          AppParamState value, $Res Function(AppParamState) then) =
      _$AppParamStateCopyWithImpl<$Res, AppParamState>;
  @useResult
  $Res call({bool mapHide, int pinpointSpotNum, bool pinpointMapBoundsDisplay});
}

/// @nodoc
class _$AppParamStateCopyWithImpl<$Res, $Val extends AppParamState>
    implements $AppParamStateCopyWith<$Res> {
  _$AppParamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapHide = null,
    Object? pinpointSpotNum = null,
    Object? pinpointMapBoundsDisplay = null,
  }) {
    return _then(_value.copyWith(
      mapHide: null == mapHide
          ? _value.mapHide
          : mapHide // ignore: cast_nullable_to_non_nullable
              as bool,
      pinpointSpotNum: null == pinpointSpotNum
          ? _value.pinpointSpotNum
          : pinpointSpotNum // ignore: cast_nullable_to_non_nullable
              as int,
      pinpointMapBoundsDisplay: null == pinpointMapBoundsDisplay
          ? _value.pinpointMapBoundsDisplay
          : pinpointMapBoundsDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppParamStateImplCopyWith<$Res>
    implements $AppParamStateCopyWith<$Res> {
  factory _$$AppParamStateImplCopyWith(
          _$AppParamStateImpl value, $Res Function(_$AppParamStateImpl) then) =
      __$$AppParamStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool mapHide, int pinpointSpotNum, bool pinpointMapBoundsDisplay});
}

/// @nodoc
class __$$AppParamStateImplCopyWithImpl<$Res>
    extends _$AppParamStateCopyWithImpl<$Res, _$AppParamStateImpl>
    implements _$$AppParamStateImplCopyWith<$Res> {
  __$$AppParamStateImplCopyWithImpl(
      _$AppParamStateImpl _value, $Res Function(_$AppParamStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapHide = null,
    Object? pinpointSpotNum = null,
    Object? pinpointMapBoundsDisplay = null,
  }) {
    return _then(_$AppParamStateImpl(
      mapHide: null == mapHide
          ? _value.mapHide
          : mapHide // ignore: cast_nullable_to_non_nullable
              as bool,
      pinpointSpotNum: null == pinpointSpotNum
          ? _value.pinpointSpotNum
          : pinpointSpotNum // ignore: cast_nullable_to_non_nullable
              as int,
      pinpointMapBoundsDisplay: null == pinpointMapBoundsDisplay
          ? _value.pinpointMapBoundsDisplay
          : pinpointMapBoundsDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppParamStateImpl implements _AppParamState {
  const _$AppParamStateImpl(
      {this.mapHide = true,
      this.pinpointSpotNum = 0,
      this.pinpointMapBoundsDisplay = false});

  @override
  @JsonKey()
  final bool mapHide;
  @override
  @JsonKey()
  final int pinpointSpotNum;
  @override
  @JsonKey()
  final bool pinpointMapBoundsDisplay;

  @override
  String toString() {
    return 'AppParamState(mapHide: $mapHide, pinpointSpotNum: $pinpointSpotNum, pinpointMapBoundsDisplay: $pinpointMapBoundsDisplay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppParamStateImpl &&
            (identical(other.mapHide, mapHide) || other.mapHide == mapHide) &&
            (identical(other.pinpointSpotNum, pinpointSpotNum) ||
                other.pinpointSpotNum == pinpointSpotNum) &&
            (identical(
                    other.pinpointMapBoundsDisplay, pinpointMapBoundsDisplay) ||
                other.pinpointMapBoundsDisplay == pinpointMapBoundsDisplay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, mapHide, pinpointSpotNum, pinpointMapBoundsDisplay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppParamStateImplCopyWith<_$AppParamStateImpl> get copyWith =>
      __$$AppParamStateImplCopyWithImpl<_$AppParamStateImpl>(this, _$identity);
}

abstract class _AppParamState implements AppParamState {
  const factory _AppParamState(
      {final bool mapHide,
      final int pinpointSpotNum,
      final bool pinpointMapBoundsDisplay}) = _$AppParamStateImpl;

  @override
  bool get mapHide;
  @override
  int get pinpointSpotNum;
  @override
  bool get pinpointMapBoundsDisplay;
  @override
  @JsonKey(ignore: true)
  _$$AppParamStateImplCopyWith<_$AppParamStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
