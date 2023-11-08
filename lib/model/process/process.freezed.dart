// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'process.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Process _$ProcessFromJson(Map<String, dynamic> json) {
  return _Process.fromJson(json);
}

/// @nodoc
mixin _$Process {
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessCopyWith<Process> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessCopyWith<$Res> {
  factory $ProcessCopyWith(Process value, $Res Function(Process) then) =
      _$ProcessCopyWithImpl<$Res, Process>;
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class _$ProcessCopyWithImpl<$Res, $Val extends Process>
    implements $ProcessCopyWith<$Res> {
  _$ProcessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessImplCopyWith<$Res> implements $ProcessCopyWith<$Res> {
  factory _$$ProcessImplCopyWith(
          _$ProcessImpl value, $Res Function(_$ProcessImpl) then) =
      __$$ProcessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String content});
}

/// @nodoc
class __$$ProcessImplCopyWithImpl<$Res>
    extends _$ProcessCopyWithImpl<$Res, _$ProcessImpl>
    implements _$$ProcessImplCopyWith<$Res> {
  __$$ProcessImplCopyWithImpl(
      _$ProcessImpl _value, $Res Function(_$ProcessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$ProcessImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessImpl implements _Process {
  const _$ProcessImpl({required this.title, required this.content});

  factory _$ProcessImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessImplFromJson(json);

  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'Process(title: $title, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessImplCopyWith<_$ProcessImpl> get copyWith =>
      __$$ProcessImplCopyWithImpl<_$ProcessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessImplToJson(
      this,
    );
  }
}

abstract class _Process implements Process {
  const factory _Process(
      {required final String title,
      required final String content}) = _$ProcessImpl;

  factory _Process.fromJson(Map<String, dynamic> json) = _$ProcessImpl.fromJson;

  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$ProcessImplCopyWith<_$ProcessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
