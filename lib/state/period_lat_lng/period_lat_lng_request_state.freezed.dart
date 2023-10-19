// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'period_lat_lng_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PeriodLatLngRequestState {
  String get flag => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeriodLatLngRequestStateCopyWith<PeriodLatLngRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodLatLngRequestStateCopyWith<$Res> {
  factory $PeriodLatLngRequestStateCopyWith(PeriodLatLngRequestState value,
          $Res Function(PeriodLatLngRequestState) then) =
      _$PeriodLatLngRequestStateCopyWithImpl<$Res, PeriodLatLngRequestState>;
  @useResult
  $Res call({String flag, DateTime? date});
}

/// @nodoc
class _$PeriodLatLngRequestStateCopyWithImpl<$Res,
        $Val extends PeriodLatLngRequestState>
    implements $PeriodLatLngRequestStateCopyWith<$Res> {
  _$PeriodLatLngRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = null,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeriodLatLngRequestStateImplCopyWith<$Res>
    implements $PeriodLatLngRequestStateCopyWith<$Res> {
  factory _$$PeriodLatLngRequestStateImplCopyWith(
          _$PeriodLatLngRequestStateImpl value,
          $Res Function(_$PeriodLatLngRequestStateImpl) then) =
      __$$PeriodLatLngRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String flag, DateTime? date});
}

/// @nodoc
class __$$PeriodLatLngRequestStateImplCopyWithImpl<$Res>
    extends _$PeriodLatLngRequestStateCopyWithImpl<$Res,
        _$PeriodLatLngRequestStateImpl>
    implements _$$PeriodLatLngRequestStateImplCopyWith<$Res> {
  __$$PeriodLatLngRequestStateImplCopyWithImpl(
      _$PeriodLatLngRequestStateImpl _value,
      $Res Function(_$PeriodLatLngRequestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flag = null,
    Object? date = freezed,
  }) {
    return _then(_$PeriodLatLngRequestStateImpl(
      flag: null == flag
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PeriodLatLngRequestStateImpl implements _PeriodLatLngRequestState {
  const _$PeriodLatLngRequestStateImpl({this.flag = '', this.date});

  @override
  @JsonKey()
  final String flag;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'PeriodLatLngRequestState(flag: $flag, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeriodLatLngRequestStateImpl &&
            (identical(other.flag, flag) || other.flag == flag) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flag, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeriodLatLngRequestStateImplCopyWith<_$PeriodLatLngRequestStateImpl>
      get copyWith => __$$PeriodLatLngRequestStateImplCopyWithImpl<
          _$PeriodLatLngRequestStateImpl>(this, _$identity);
}

abstract class _PeriodLatLngRequestState implements PeriodLatLngRequestState {
  const factory _PeriodLatLngRequestState(
      {final String flag,
      final DateTime? date}) = _$PeriodLatLngRequestStateImpl;

  @override
  String get flag;
  @override
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$PeriodLatLngRequestStateImplCopyWith<_$PeriodLatLngRequestStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
