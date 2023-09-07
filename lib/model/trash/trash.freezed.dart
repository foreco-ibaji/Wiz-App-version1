// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trash.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Trash _$TrashFromJson(Map<String, dynamic> json) {
  return _Trash.fromJson(json);
}

/// @nodoc
mixin _$Trash {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrashCopyWith<Trash> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrashCopyWith<$Res> {
  factory $TrashCopyWith(Trash value, $Res Function(Trash) then) =
      _$TrashCopyWithImpl<$Res, Trash>;
  @useResult
  $Res call({int id, String name, String? iconUrl});
}

/// @nodoc
class _$TrashCopyWithImpl<$Res, $Val extends Trash>
    implements $TrashCopyWith<$Res> {
  _$TrashCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrashCopyWith<$Res> implements $TrashCopyWith<$Res> {
  factory _$$_TrashCopyWith(_$_Trash value, $Res Function(_$_Trash) then) =
      __$$_TrashCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? iconUrl});
}

/// @nodoc
class __$$_TrashCopyWithImpl<$Res> extends _$TrashCopyWithImpl<$Res, _$_Trash>
    implements _$$_TrashCopyWith<$Res> {
  __$$_TrashCopyWithImpl(_$_Trash _value, $Res Function(_$_Trash) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_$_Trash(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Trash implements _Trash {
  const _$_Trash({required this.id, required this.name, required this.iconUrl});

  factory _$_Trash.fromJson(Map<String, dynamic> json) =>
      _$$_TrashFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? iconUrl;

  @override
  String toString() {
    return 'Trash(id: $id, name: $name, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trash &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrashCopyWith<_$_Trash> get copyWith =>
      __$$_TrashCopyWithImpl<_$_Trash>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrashToJson(
      this,
    );
  }
}

abstract class _Trash implements Trash {
  const factory _Trash(
      {required final int id,
      required final String name,
      required final String? iconUrl}) = _$_Trash;

  factory _Trash.fromJson(Map<String, dynamic> json) = _$_Trash.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$_TrashCopyWith<_$_Trash> get copyWith =>
      throw _privateConstructorUsedError;
}
