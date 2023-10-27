// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Expect _$ExpectFromJson(Map<String, dynamic> json) {
  return _Expect.fromJson(json);
}

/// @nodoc
mixin _$Expect {
  String get imgUrl => throw _privateConstructorUsedError;
  String get imgName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpectCopyWith<Expect> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpectCopyWith<$Res> {
  factory $ExpectCopyWith(Expect value, $Res Function(Expect) then) =
      _$ExpectCopyWithImpl<$Res, Expect>;
  @useResult
  $Res call({String imgUrl, String imgName});
}

/// @nodoc
class _$ExpectCopyWithImpl<$Res, $Val extends Expect>
    implements $ExpectCopyWith<$Res> {
  _$ExpectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? imgName = null,
  }) {
    return _then(_value.copyWith(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imgName: null == imgName
          ? _value.imgName
          : imgName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpectImplCopyWith<$Res> implements $ExpectCopyWith<$Res> {
  factory _$$ExpectImplCopyWith(
          _$ExpectImpl value, $Res Function(_$ExpectImpl) then) =
      __$$ExpectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imgUrl, String imgName});
}

/// @nodoc
class __$$ExpectImplCopyWithImpl<$Res>
    extends _$ExpectCopyWithImpl<$Res, _$ExpectImpl>
    implements _$$ExpectImplCopyWith<$Res> {
  __$$ExpectImplCopyWithImpl(
      _$ExpectImpl _value, $Res Function(_$ExpectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
    Object? imgName = null,
  }) {
    return _then(_$ExpectImpl(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imgName: null == imgName
          ? _value.imgName
          : imgName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpectImpl implements _Expect {
  const _$ExpectImpl({required this.imgUrl, required this.imgName});

  factory _$ExpectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpectImplFromJson(json);

  @override
  final String imgUrl;
  @override
  final String imgName;

  @override
  String toString() {
    return 'Expect(imgUrl: $imgUrl, imgName: $imgName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpectImpl &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.imgName, imgName) || other.imgName == imgName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imgUrl, imgName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpectImplCopyWith<_$ExpectImpl> get copyWith =>
      __$$ExpectImplCopyWithImpl<_$ExpectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpectImplToJson(
      this,
    );
  }
}

abstract class _Expect implements Expect {
  const factory _Expect(
      {required final String imgUrl,
      required final String imgName}) = _$ExpectImpl;

  factory _Expect.fromJson(Map<String, dynamic> json) = _$ExpectImpl.fromJson;

  @override
  String get imgUrl;
  @override
  String get imgName;
  @override
  @JsonKey(ignore: true)
  _$$ExpectImplCopyWith<_$ExpectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
