// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MissionDetail _$MissionDetailFromJson(Map<String, dynamic> json) {
  return _MissionDetail.fromJson(json);
}

/// @nodoc
mixin _$MissionDetail {
  MissionInfo get missionInfo => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  List<Choice> get choices => throw _privateConstructorUsedError;
  Answer get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionDetailCopyWith<MissionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionDetailCopyWith<$Res> {
  factory $MissionDetailCopyWith(
          MissionDetail value, $Res Function(MissionDetail) then) =
      _$MissionDetailCopyWithImpl<$Res, MissionDetail>;
  @useResult
  $Res call(
      {MissionInfo missionInfo,
      List<String> images,
      List<Choice> choices,
      Answer answer});

  $MissionInfoCopyWith<$Res> get missionInfo;
  $AnswerCopyWith<$Res> get answer;
}

/// @nodoc
class _$MissionDetailCopyWithImpl<$Res, $Val extends MissionDetail>
    implements $MissionDetailCopyWith<$Res> {
  _$MissionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionInfo = null,
    Object? images = null,
    Object? choices = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      missionInfo: null == missionInfo
          ? _value.missionInfo
          : missionInfo // ignore: cast_nullable_to_non_nullable
              as MissionInfo,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MissionInfoCopyWith<$Res> get missionInfo {
    return $MissionInfoCopyWith<$Res>(_value.missionInfo, (value) {
      return _then(_value.copyWith(missionInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswerCopyWith<$Res> get answer {
    return $AnswerCopyWith<$Res>(_value.answer, (value) {
      return _then(_value.copyWith(answer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MissionDetailImplCopyWith<$Res>
    implements $MissionDetailCopyWith<$Res> {
  factory _$$MissionDetailImplCopyWith(
          _$MissionDetailImpl value, $Res Function(_$MissionDetailImpl) then) =
      __$$MissionDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MissionInfo missionInfo,
      List<String> images,
      List<Choice> choices,
      Answer answer});

  @override
  $MissionInfoCopyWith<$Res> get missionInfo;
  @override
  $AnswerCopyWith<$Res> get answer;
}

/// @nodoc
class __$$MissionDetailImplCopyWithImpl<$Res>
    extends _$MissionDetailCopyWithImpl<$Res, _$MissionDetailImpl>
    implements _$$MissionDetailImplCopyWith<$Res> {
  __$$MissionDetailImplCopyWithImpl(
      _$MissionDetailImpl _value, $Res Function(_$MissionDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionInfo = null,
    Object? images = null,
    Object? choices = null,
    Object? answer = null,
  }) {
    return _then(_$MissionDetailImpl(
      missionInfo: null == missionInfo
          ? _value.missionInfo
          : missionInfo // ignore: cast_nullable_to_non_nullable
              as MissionInfo,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choice>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionDetailImpl
    with DiagnosticableTreeMixin
    implements _MissionDetail {
  const _$MissionDetailImpl(
      {required this.missionInfo,
      required final List<String> images,
      required final List<Choice> choices,
      required this.answer})
      : _images = images,
        _choices = choices;

  factory _$MissionDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionDetailImplFromJson(json);

  @override
  final MissionInfo missionInfo;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<Choice> _choices;
  @override
  List<Choice> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final Answer answer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MissionDetail(missionInfo: $missionInfo, images: $images, choices: $choices, answer: $answer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MissionDetail'))
      ..add(DiagnosticsProperty('missionInfo', missionInfo))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('choices', choices))
      ..add(DiagnosticsProperty('answer', answer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionDetailImpl &&
            (identical(other.missionInfo, missionInfo) ||
                other.missionInfo == missionInfo) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      missionInfo,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_choices),
      answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionDetailImplCopyWith<_$MissionDetailImpl> get copyWith =>
      __$$MissionDetailImplCopyWithImpl<_$MissionDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionDetailImplToJson(
      this,
    );
  }
}

abstract class _MissionDetail implements MissionDetail {
  const factory _MissionDetail(
      {required final MissionInfo missionInfo,
      required final List<String> images,
      required final List<Choice> choices,
      required final Answer answer}) = _$MissionDetailImpl;

  factory _MissionDetail.fromJson(Map<String, dynamic> json) =
      _$MissionDetailImpl.fromJson;

  @override
  MissionInfo get missionInfo;
  @override
  List<String> get images;
  @override
  List<Choice> get choices;
  @override
  Answer get answer;
  @override
  @JsonKey(ignore: true)
  _$$MissionDetailImplCopyWith<_$MissionDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Choice _$ChoiceFromJson(Map<String, dynamic> json) {
  return _Choice.fromJson(json);
}

/// @nodoc
mixin _$Choice {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoiceCopyWith<Choice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceCopyWith<$Res> {
  factory $ChoiceCopyWith(Choice value, $Res Function(Choice) then) =
      _$ChoiceCopyWithImpl<$Res, Choice>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$ChoiceCopyWithImpl<$Res, $Val extends Choice>
    implements $ChoiceCopyWith<$Res> {
  _$ChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChoiceImplCopyWith<$Res> implements $ChoiceCopyWith<$Res> {
  factory _$$ChoiceImplCopyWith(
          _$ChoiceImpl value, $Res Function(_$ChoiceImpl) then) =
      __$$ChoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$ChoiceImplCopyWithImpl<$Res>
    extends _$ChoiceCopyWithImpl<$Res, _$ChoiceImpl>
    implements _$$ChoiceImplCopyWith<$Res> {
  __$$ChoiceImplCopyWithImpl(
      _$ChoiceImpl _value, $Res Function(_$ChoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$ChoiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChoiceImpl with DiagnosticableTreeMixin implements _Choice {
  const _$ChoiceImpl({required this.id, required this.name});

  factory _$ChoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChoiceImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Choice(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Choice'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoiceImplCopyWith<_$ChoiceImpl> get copyWith =>
      __$$ChoiceImplCopyWithImpl<_$ChoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChoiceImplToJson(
      this,
    );
  }
}

abstract class _Choice implements Choice {
  const factory _Choice({required final int id, required final String name}) =
      _$ChoiceImpl;

  factory _Choice.fromJson(Map<String, dynamic> json) = _$ChoiceImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ChoiceImplCopyWith<_$ChoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get disposalMethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call({int id, String name, String imageUrl, String disposalMethod});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? disposalMethod = null,
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      disposalMethod: null == disposalMethod
          ? _value.disposalMethod
          : disposalMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String imageUrl, String disposalMethod});
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? disposalMethod = null,
  }) {
    return _then(_$AnswerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      disposalMethod: null == disposalMethod
          ? _value.disposalMethod
          : disposalMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerImpl with DiagnosticableTreeMixin implements _Answer {
  const _$AnswerImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.disposalMethod});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String disposalMethod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Answer(id: $id, name: $name, imageUrl: $imageUrl, disposalMethod: $disposalMethod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Answer'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('disposalMethod', disposalMethod));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.disposalMethod, disposalMethod) ||
                other.disposalMethod == disposalMethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, imageUrl, disposalMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerImplToJson(
      this,
    );
  }
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {required final int id,
      required final String name,
      required final String imageUrl,
      required final String disposalMethod}) = _$AnswerImpl;

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get disposalMethod;
  @override
  @JsonKey(ignore: true)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
