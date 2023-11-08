// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhotoResult _$PhotoResultFromJson(Map<String, dynamic> json) {
  return _PhotoResult.fromJson(json);
}

/// @nodoc
mixin _$PhotoResult {
  String get message => throw _privateConstructorUsedError;
  List<ResultDetail> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoResultCopyWith<PhotoResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoResultCopyWith<$Res> {
  factory $PhotoResultCopyWith(
          PhotoResult value, $Res Function(PhotoResult) then) =
      _$PhotoResultCopyWithImpl<$Res, PhotoResult>;
  @useResult
  $Res call({String message, List<ResultDetail> result});
}

/// @nodoc
class _$PhotoResultCopyWithImpl<$Res, $Val extends PhotoResult>
    implements $PhotoResultCopyWith<$Res> {
  _$PhotoResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ResultDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoResultImplCopyWith<$Res>
    implements $PhotoResultCopyWith<$Res> {
  factory _$$PhotoResultImplCopyWith(
          _$PhotoResultImpl value, $Res Function(_$PhotoResultImpl) then) =
      __$$PhotoResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<ResultDetail> result});
}

/// @nodoc
class __$$PhotoResultImplCopyWithImpl<$Res>
    extends _$PhotoResultCopyWithImpl<$Res, _$PhotoResultImpl>
    implements _$$PhotoResultImplCopyWith<$Res> {
  __$$PhotoResultImplCopyWithImpl(
      _$PhotoResultImpl _value, $Res Function(_$PhotoResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? result = null,
  }) {
    return _then(_$PhotoResultImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<ResultDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoResultImpl implements _PhotoResult {
  const _$PhotoResultImpl(
      {required this.message, required final List<ResultDetail> result})
      : _result = result;

  factory _$PhotoResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoResultImplFromJson(json);

  @override
  final String message;
  final List<ResultDetail> _result;
  @override
  List<ResultDetail> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  String toString() {
    return 'PhotoResult(message: $message, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoResultImplCopyWith<_$PhotoResultImpl> get copyWith =>
      __$$PhotoResultImplCopyWithImpl<_$PhotoResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoResultImplToJson(
      this,
    );
  }
}

abstract class _PhotoResult implements PhotoResult {
  const factory _PhotoResult(
      {required final String message,
      required final List<ResultDetail> result}) = _$PhotoResultImpl;

  factory _PhotoResult.fromJson(Map<String, dynamic> json) =
      _$PhotoResultImpl.fromJson;

  @override
  String get message;
  @override
  List<ResultDetail> get result;
  @override
  @JsonKey(ignore: true)
  _$$PhotoResultImplCopyWith<_$PhotoResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultDetail _$ResultDetailFromJson(Map<String, dynamic> json) {
  return _ResultDetail.fromJson(json);
}

/// @nodoc
mixin _$ResultDetail {
  String get name => throw _privateConstructorUsedError;
  List<int> get coordinate => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultDetailCopyWith<ResultDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDetailCopyWith<$Res> {
  factory $ResultDetailCopyWith(
          ResultDetail value, $Res Function(ResultDetail) then) =
      _$ResultDetailCopyWithImpl<$Res, ResultDetail>;
  @useResult
  $Res call({String name, List<int> coordinate, int id});
}

/// @nodoc
class _$ResultDetailCopyWithImpl<$Res, $Val extends ResultDetail>
    implements $ResultDetailCopyWith<$Res> {
  _$ResultDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? coordinate = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coordinate: null == coordinate
          ? _value.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as List<int>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultDetailImplCopyWith<$Res>
    implements $ResultDetailCopyWith<$Res> {
  factory _$$ResultDetailImplCopyWith(
          _$ResultDetailImpl value, $Res Function(_$ResultDetailImpl) then) =
      __$$ResultDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<int> coordinate, int id});
}

/// @nodoc
class __$$ResultDetailImplCopyWithImpl<$Res>
    extends _$ResultDetailCopyWithImpl<$Res, _$ResultDetailImpl>
    implements _$$ResultDetailImplCopyWith<$Res> {
  __$$ResultDetailImplCopyWithImpl(
      _$ResultDetailImpl _value, $Res Function(_$ResultDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? coordinate = null,
    Object? id = null,
  }) {
    return _then(_$ResultDetailImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coordinate: null == coordinate
          ? _value._coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as List<int>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDetailImpl implements _ResultDetail {
  const _$ResultDetailImpl(
      {required this.name,
      required final List<int> coordinate,
      required this.id})
      : _coordinate = coordinate;

  factory _$ResultDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDetailImplFromJson(json);

  @override
  final String name;
  final List<int> _coordinate;
  @override
  List<int> get coordinate {
    if (_coordinate is EqualUnmodifiableListView) return _coordinate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinate);
  }

  @override
  final int id;

  @override
  String toString() {
    return 'ResultDetail(name: $name, coordinate: $coordinate, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDetailImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._coordinate, _coordinate) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_coordinate), id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultDetailImplCopyWith<_$ResultDetailImpl> get copyWith =>
      __$$ResultDetailImplCopyWithImpl<_$ResultDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDetailImplToJson(
      this,
    );
  }
}

abstract class _ResultDetail implements ResultDetail {
  const factory _ResultDetail(
      {required final String name,
      required final List<int> coordinate,
      required final int id}) = _$ResultDetailImpl;

  factory _ResultDetail.fromJson(Map<String, dynamic> json) =
      _$ResultDetailImpl.fromJson;

  @override
  String get name;
  @override
  List<int> get coordinate;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$ResultDetailImplCopyWith<_$ResultDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
