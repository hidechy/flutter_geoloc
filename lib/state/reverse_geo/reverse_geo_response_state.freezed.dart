// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reverse_geo_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReverseGeoResponseState {
  List<String> get addressComponentsNameList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReverseGeoResponseStateCopyWith<ReverseGeoResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeoResponseStateCopyWith<$Res> {
  factory $ReverseGeoResponseStateCopyWith(ReverseGeoResponseState value,
          $Res Function(ReverseGeoResponseState) then) =
      _$ReverseGeoResponseStateCopyWithImpl<$Res, ReverseGeoResponseState>;
  @useResult
  $Res call({List<String> addressComponentsNameList});
}

/// @nodoc
class _$ReverseGeoResponseStateCopyWithImpl<$Res,
        $Val extends ReverseGeoResponseState>
    implements $ReverseGeoResponseStateCopyWith<$Res> {
  _$ReverseGeoResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressComponentsNameList = null,
  }) {
    return _then(_value.copyWith(
      addressComponentsNameList: null == addressComponentsNameList
          ? _value.addressComponentsNameList
          : addressComponentsNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReverseGeoResponseStateImplCopyWith<$Res>
    implements $ReverseGeoResponseStateCopyWith<$Res> {
  factory _$$ReverseGeoResponseStateImplCopyWith(
          _$ReverseGeoResponseStateImpl value,
          $Res Function(_$ReverseGeoResponseStateImpl) then) =
      __$$ReverseGeoResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> addressComponentsNameList});
}

/// @nodoc
class __$$ReverseGeoResponseStateImplCopyWithImpl<$Res>
    extends _$ReverseGeoResponseStateCopyWithImpl<$Res,
        _$ReverseGeoResponseStateImpl>
    implements _$$ReverseGeoResponseStateImplCopyWith<$Res> {
  __$$ReverseGeoResponseStateImplCopyWithImpl(
      _$ReverseGeoResponseStateImpl _value,
      $Res Function(_$ReverseGeoResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressComponentsNameList = null,
  }) {
    return _then(_$ReverseGeoResponseStateImpl(
      addressComponentsNameList: null == addressComponentsNameList
          ? _value._addressComponentsNameList
          : addressComponentsNameList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ReverseGeoResponseStateImpl implements _ReverseGeoResponseState {
  const _$ReverseGeoResponseStateImpl(
      {final List<String> addressComponentsNameList = const []})
      : _addressComponentsNameList = addressComponentsNameList;

  final List<String> _addressComponentsNameList;
  @override
  @JsonKey()
  List<String> get addressComponentsNameList {
    if (_addressComponentsNameList is EqualUnmodifiableListView)
      return _addressComponentsNameList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressComponentsNameList);
  }

  @override
  String toString() {
    return 'ReverseGeoResponseState(addressComponentsNameList: $addressComponentsNameList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeoResponseStateImpl &&
            const DeepCollectionEquality().equals(
                other._addressComponentsNameList, _addressComponentsNameList));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_addressComponentsNameList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseGeoResponseStateImplCopyWith<_$ReverseGeoResponseStateImpl>
      get copyWith => __$$ReverseGeoResponseStateImplCopyWithImpl<
          _$ReverseGeoResponseStateImpl>(this, _$identity);
}

abstract class _ReverseGeoResponseState implements ReverseGeoResponseState {
  const factory _ReverseGeoResponseState(
          {final List<String> addressComponentsNameList}) =
      _$ReverseGeoResponseStateImpl;

  @override
  List<String> get addressComponentsNameList;
  @override
  @JsonKey(ignore: true)
  _$$ReverseGeoResponseStateImplCopyWith<_$ReverseGeoResponseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
