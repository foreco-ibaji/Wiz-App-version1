// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailMethod _$DetailMethodFromJson(Map<String, dynamic> json) {
  return _DetailMethod.fromJson(json);
}

/// @nodoc
mixin _$DetailMethod {
  int get id => throw _privateConstructorUsedError;
  String get detailType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get disposalMethod => throw _privateConstructorUsedError;
  DisposalInfo get disposalInfoDto => throw _privateConstructorUsedError;
  List<String> get remark => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailMethodCopyWith<DetailMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailMethodCopyWith<$Res> {
  factory $DetailMethodCopyWith(
          DetailMethod value, $Res Function(DetailMethod) then) =
      _$DetailMethodCopyWithImpl<$Res, DetailMethod>;
  @useResult
  $Res call(
      {int id,
      String detailType,
      String name,
      String disposalMethod,
      DisposalInfo disposalInfoDto,
      List<String> remark});

  $DisposalInfoCopyWith<$Res> get disposalInfoDto;
}

/// @nodoc
class _$DetailMethodCopyWithImpl<$Res, $Val extends DetailMethod>
    implements $DetailMethodCopyWith<$Res> {
  _$DetailMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? detailType = null,
    Object? name = null,
    Object? disposalMethod = null,
    Object? disposalInfoDto = null,
    Object? remark = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      detailType: null == detailType
          ? _value.detailType
          : detailType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      disposalMethod: null == disposalMethod
          ? _value.disposalMethod
          : disposalMethod // ignore: cast_nullable_to_non_nullable
              as String,
      disposalInfoDto: null == disposalInfoDto
          ? _value.disposalInfoDto
          : disposalInfoDto // ignore: cast_nullable_to_non_nullable
              as DisposalInfo,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DisposalInfoCopyWith<$Res> get disposalInfoDto {
    return $DisposalInfoCopyWith<$Res>(_value.disposalInfoDto, (value) {
      return _then(_value.copyWith(disposalInfoDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailMethodCopyWith<$Res>
    implements $DetailMethodCopyWith<$Res> {
  factory _$$_DetailMethodCopyWith(
          _$_DetailMethod value, $Res Function(_$_DetailMethod) then) =
      __$$_DetailMethodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String detailType,
      String name,
      String disposalMethod,
      DisposalInfo disposalInfoDto,
      List<String> remark});

  @override
  $DisposalInfoCopyWith<$Res> get disposalInfoDto;
}

/// @nodoc
class __$$_DetailMethodCopyWithImpl<$Res>
    extends _$DetailMethodCopyWithImpl<$Res, _$_DetailMethod>
    implements _$$_DetailMethodCopyWith<$Res> {
  __$$_DetailMethodCopyWithImpl(
      _$_DetailMethod _value, $Res Function(_$_DetailMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? detailType = null,
    Object? name = null,
    Object? disposalMethod = null,
    Object? disposalInfoDto = null,
    Object? remark = null,
  }) {
    return _then(_$_DetailMethod(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      detailType: null == detailType
          ? _value.detailType
          : detailType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      disposalMethod: null == disposalMethod
          ? _value.disposalMethod
          : disposalMethod // ignore: cast_nullable_to_non_nullable
              as String,
      disposalInfoDto: null == disposalInfoDto
          ? _value.disposalInfoDto
          : disposalInfoDto // ignore: cast_nullable_to_non_nullable
              as DisposalInfo,
      remark: null == remark
          ? _value._remark
          : remark // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailMethod implements _DetailMethod {
  const _$_DetailMethod(
      {required this.id,
      required this.detailType,
      required this.name,
      required this.disposalMethod,
      required this.disposalInfoDto,
      required final List<String> remark})
      : _remark = remark;

  factory _$_DetailMethod.fromJson(Map<String, dynamic> json) =>
      _$$_DetailMethodFromJson(json);

  @override
  final int id;
  @override
  final String detailType;
  @override
  final String name;
  @override
  final String disposalMethod;
  @override
  final DisposalInfo disposalInfoDto;
  final List<String> _remark;
  @override
  List<String> get remark {
    if (_remark is EqualUnmodifiableListView) return _remark;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_remark);
  }

  @override
  String toString() {
    return 'DetailMethod(id: $id, detailType: $detailType, name: $name, disposalMethod: $disposalMethod, disposalInfoDto: $disposalInfoDto, remark: $remark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailMethod &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.detailType, detailType) ||
                other.detailType == detailType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.disposalMethod, disposalMethod) ||
                other.disposalMethod == disposalMethod) &&
            (identical(other.disposalInfoDto, disposalInfoDto) ||
                other.disposalInfoDto == disposalInfoDto) &&
            const DeepCollectionEquality().equals(other._remark, _remark));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      detailType,
      name,
      disposalMethod,
      disposalInfoDto,
      const DeepCollectionEquality().hash(_remark));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailMethodCopyWith<_$_DetailMethod> get copyWith =>
      __$$_DetailMethodCopyWithImpl<_$_DetailMethod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailMethodToJson(
      this,
    );
  }
}

abstract class _DetailMethod implements DetailMethod {
  const factory _DetailMethod(
      {required final int id,
      required final String detailType,
      required final String name,
      required final String disposalMethod,
      required final DisposalInfo disposalInfoDto,
      required final List<String> remark}) = _$_DetailMethod;

  factory _DetailMethod.fromJson(Map<String, dynamic> json) =
      _$_DetailMethod.fromJson;

  @override
  int get id;
  @override
  String get detailType;
  @override
  String get name;
  @override
  String get disposalMethod;
  @override
  DisposalInfo get disposalInfoDto;
  @override
  List<String> get remark;
  @override
  @JsonKey(ignore: true)
  _$$_DetailMethodCopyWith<_$_DetailMethod> get copyWith =>
      throw _privateConstructorUsedError;
}
