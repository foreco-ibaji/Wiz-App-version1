// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryMethod _$CategoryMethodFromJson(Map<String, dynamic> json) {
  return _CategoryMethod.fromJson(json);
}

/// @nodoc
mixin _$CategoryMethod {
  String get categoryName => throw _privateConstructorUsedError;
  String get categoryIcon => throw _privateConstructorUsedError;
  List<String>? get disposalMethod => throw _privateConstructorUsedError;
  List<String>? get remark => throw _privateConstructorUsedError;
  DisposalInfo get disposalInfo => throw _privateConstructorUsedError;
  List<Category>? get recommendCategories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryMethodCopyWith<CategoryMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryMethodCopyWith<$Res> {
  factory $CategoryMethodCopyWith(
          CategoryMethod value, $Res Function(CategoryMethod) then) =
      _$CategoryMethodCopyWithImpl<$Res, CategoryMethod>;
  @useResult
  $Res call(
      {String categoryName,
      String categoryIcon,
      List<String>? disposalMethod,
      List<String>? remark,
      DisposalInfo disposalInfo,
      List<Category>? recommendCategories});

  $DisposalInfoCopyWith<$Res> get disposalInfo;
}

/// @nodoc
class _$CategoryMethodCopyWithImpl<$Res, $Val extends CategoryMethod>
    implements $CategoryMethodCopyWith<$Res> {
  _$CategoryMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? categoryIcon = null,
    Object? disposalMethod = freezed,
    Object? remark = freezed,
    Object? disposalInfo = null,
    Object? recommendCategories = freezed,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIcon: null == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      disposalMethod: freezed == disposalMethod
          ? _value.disposalMethod
          : disposalMethod // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      disposalInfo: null == disposalInfo
          ? _value.disposalInfo
          : disposalInfo // ignore: cast_nullable_to_non_nullable
              as DisposalInfo,
      recommendCategories: freezed == recommendCategories
          ? _value.recommendCategories
          : recommendCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DisposalInfoCopyWith<$Res> get disposalInfo {
    return $DisposalInfoCopyWith<$Res>(_value.disposalInfo, (value) {
      return _then(_value.copyWith(disposalInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CategoryMethodCopyWith<$Res>
    implements $CategoryMethodCopyWith<$Res> {
  factory _$$_CategoryMethodCopyWith(
          _$_CategoryMethod value, $Res Function(_$_CategoryMethod) then) =
      __$$_CategoryMethodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryName,
      String categoryIcon,
      List<String>? disposalMethod,
      List<String>? remark,
      DisposalInfo disposalInfo,
      List<Category>? recommendCategories});

  @override
  $DisposalInfoCopyWith<$Res> get disposalInfo;
}

/// @nodoc
class __$$_CategoryMethodCopyWithImpl<$Res>
    extends _$CategoryMethodCopyWithImpl<$Res, _$_CategoryMethod>
    implements _$$_CategoryMethodCopyWith<$Res> {
  __$$_CategoryMethodCopyWithImpl(
      _$_CategoryMethod _value, $Res Function(_$_CategoryMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? categoryIcon = null,
    Object? disposalMethod = freezed,
    Object? remark = freezed,
    Object? disposalInfo = null,
    Object? recommendCategories = freezed,
  }) {
    return _then(_$_CategoryMethod(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIcon: null == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      disposalMethod: freezed == disposalMethod
          ? _value._disposalMethod
          : disposalMethod // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      remark: freezed == remark
          ? _value._remark
          : remark // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      disposalInfo: null == disposalInfo
          ? _value.disposalInfo
          : disposalInfo // ignore: cast_nullable_to_non_nullable
              as DisposalInfo,
      recommendCategories: freezed == recommendCategories
          ? _value._recommendCategories
          : recommendCategories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryMethod implements _CategoryMethod {
  const _$_CategoryMethod(
      {required this.categoryName,
      required this.categoryIcon,
      final List<String>? disposalMethod,
      final List<String>? remark,
      required this.disposalInfo,
      final List<Category>? recommendCategories})
      : _disposalMethod = disposalMethod,
        _remark = remark,
        _recommendCategories = recommendCategories;

  factory _$_CategoryMethod.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryMethodFromJson(json);

  @override
  final String categoryName;
  @override
  final String categoryIcon;
  final List<String>? _disposalMethod;
  @override
  List<String>? get disposalMethod {
    final value = _disposalMethod;
    if (value == null) return null;
    if (_disposalMethod is EqualUnmodifiableListView) return _disposalMethod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _remark;
  @override
  List<String>? get remark {
    final value = _remark;
    if (value == null) return null;
    if (_remark is EqualUnmodifiableListView) return _remark;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DisposalInfo disposalInfo;
  final List<Category>? _recommendCategories;
  @override
  List<Category>? get recommendCategories {
    final value = _recommendCategories;
    if (value == null) return null;
    if (_recommendCategories is EqualUnmodifiableListView)
      return _recommendCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryMethod(categoryName: $categoryName, categoryIcon: $categoryIcon, disposalMethod: $disposalMethod, remark: $remark, disposalInfo: $disposalInfo, recommendCategories: $recommendCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryMethod &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            const DeepCollectionEquality()
                .equals(other._disposalMethod, _disposalMethod) &&
            const DeepCollectionEquality().equals(other._remark, _remark) &&
            (identical(other.disposalInfo, disposalInfo) ||
                other.disposalInfo == disposalInfo) &&
            const DeepCollectionEquality()
                .equals(other._recommendCategories, _recommendCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      categoryName,
      categoryIcon,
      const DeepCollectionEquality().hash(_disposalMethod),
      const DeepCollectionEquality().hash(_remark),
      disposalInfo,
      const DeepCollectionEquality().hash(_recommendCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryMethodCopyWith<_$_CategoryMethod> get copyWith =>
      __$$_CategoryMethodCopyWithImpl<_$_CategoryMethod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryMethodToJson(
      this,
    );
  }
}

abstract class _CategoryMethod implements CategoryMethod {
  const factory _CategoryMethod(
      {required final String categoryName,
      required final String categoryIcon,
      final List<String>? disposalMethod,
      final List<String>? remark,
      required final DisposalInfo disposalInfo,
      final List<Category>? recommendCategories}) = _$_CategoryMethod;

  factory _CategoryMethod.fromJson(Map<String, dynamic> json) =
      _$_CategoryMethod.fromJson;

  @override
  String get categoryName;
  @override
  String get categoryIcon;
  @override
  List<String>? get disposalMethod;
  @override
  List<String>? get remark;
  @override
  DisposalInfo get disposalInfo;
  @override
  List<Category>? get recommendCategories;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryMethodCopyWith<_$_CategoryMethod> get copyWith =>
      throw _privateConstructorUsedError;
}
