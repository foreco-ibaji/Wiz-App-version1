// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disposalInfo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DisposalInfo _$DisposalInfoFromJson(Map<String, dynamic> json) {
  return _DisposalInfo.fromJson(json);
}

/// @nodoc
mixin _$DisposalInfo {
  List<String> get days => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisposalInfoCopyWith<DisposalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisposalInfoCopyWith<$Res> {
  factory $DisposalInfoCopyWith(
          DisposalInfo value, $Res Function(DisposalInfo) then) =
      _$DisposalInfoCopyWithImpl<$Res, DisposalInfo>;
  @useResult
  $Res call({List<String> days, String time});
}

/// @nodoc
class _$DisposalInfoCopyWithImpl<$Res, $Val extends DisposalInfo>
    implements $DisposalInfoCopyWith<$Res> {
  _$DisposalInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisposalInfoImplCopyWith<$Res>
    implements $DisposalInfoCopyWith<$Res> {
  factory _$$DisposalInfoImplCopyWith(
          _$DisposalInfoImpl value, $Res Function(_$DisposalInfoImpl) then) =
      __$$DisposalInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> days, String time});
}

/// @nodoc
class __$$DisposalInfoImplCopyWithImpl<$Res>
    extends _$DisposalInfoCopyWithImpl<$Res, _$DisposalInfoImpl>
    implements _$$DisposalInfoImplCopyWith<$Res> {
  __$$DisposalInfoImplCopyWithImpl(
      _$DisposalInfoImpl _value, $Res Function(_$DisposalInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? time = null,
  }) {
    return _then(_$DisposalInfoImpl(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DisposalInfoImpl implements _DisposalInfo {
  const _$DisposalInfoImpl(
      {required final List<String> days, required this.time})
      : _days = days;

  factory _$DisposalInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisposalInfoImplFromJson(json);

  final List<String> _days;
  @override
  List<String> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  final String time;

  @override
  String toString() {
    return 'DisposalInfo(days: $days, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisposalInfoImpl &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_days), time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisposalInfoImplCopyWith<_$DisposalInfoImpl> get copyWith =>
      __$$DisposalInfoImplCopyWithImpl<_$DisposalInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DisposalInfoImplToJson(
      this,
    );
  }
}

abstract class _DisposalInfo implements DisposalInfo {
  const factory _DisposalInfo(
      {required final List<String> days,
      required final String time}) = _$DisposalInfoImpl;

  factory _DisposalInfo.fromJson(Map<String, dynamic> json) =
      _$DisposalInfoImpl.fromJson;

  @override
  List<String> get days;
  @override
  String get time;
  @override
  @JsonKey(ignore: true)
  _$$DisposalInfoImplCopyWith<_$DisposalInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
