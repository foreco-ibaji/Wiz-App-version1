// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motivation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Motivation _$MotivationFromJson(Map<String, dynamic> json) {
  return _Motivation.fromJson(json);
}

/// @nodoc
mixin _$Motivation {
  List<Process> get recyclingProcess => throw _privateConstructorUsedError;
  List<Expect> get time => throw _privateConstructorUsedError;
  List<Process> get ifYouDoNot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotivationCopyWith<Motivation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotivationCopyWith<$Res> {
  factory $MotivationCopyWith(
          Motivation value, $Res Function(Motivation) then) =
      _$MotivationCopyWithImpl<$Res, Motivation>;
  @useResult
  $Res call(
      {List<Process> recyclingProcess,
      List<Expect> time,
      List<Process> ifYouDoNot});
}

/// @nodoc
class _$MotivationCopyWithImpl<$Res, $Val extends Motivation>
    implements $MotivationCopyWith<$Res> {
  _$MotivationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recyclingProcess = null,
    Object? time = null,
    Object? ifYouDoNot = null,
  }) {
    return _then(_value.copyWith(
      recyclingProcess: null == recyclingProcess
          ? _value.recyclingProcess
          : recyclingProcess // ignore: cast_nullable_to_non_nullable
              as List<Process>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<Expect>,
      ifYouDoNot: null == ifYouDoNot
          ? _value.ifYouDoNot
          : ifYouDoNot // ignore: cast_nullable_to_non_nullable
              as List<Process>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MotivationImplCopyWith<$Res>
    implements $MotivationCopyWith<$Res> {
  factory _$$MotivationImplCopyWith(
          _$MotivationImpl value, $Res Function(_$MotivationImpl) then) =
      __$$MotivationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Process> recyclingProcess,
      List<Expect> time,
      List<Process> ifYouDoNot});
}

/// @nodoc
class __$$MotivationImplCopyWithImpl<$Res>
    extends _$MotivationCopyWithImpl<$Res, _$MotivationImpl>
    implements _$$MotivationImplCopyWith<$Res> {
  __$$MotivationImplCopyWithImpl(
      _$MotivationImpl _value, $Res Function(_$MotivationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recyclingProcess = null,
    Object? time = null,
    Object? ifYouDoNot = null,
  }) {
    return _then(_$MotivationImpl(
      recyclingProcess: null == recyclingProcess
          ? _value._recyclingProcess
          : recyclingProcess // ignore: cast_nullable_to_non_nullable
              as List<Process>,
      time: null == time
          ? _value._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<Expect>,
      ifYouDoNot: null == ifYouDoNot
          ? _value._ifYouDoNot
          : ifYouDoNot // ignore: cast_nullable_to_non_nullable
              as List<Process>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MotivationImpl implements _Motivation {
  const _$MotivationImpl(
      {required final List<Process> recyclingProcess,
      required final List<Expect> time,
      required final List<Process> ifYouDoNot})
      : _recyclingProcess = recyclingProcess,
        _time = time,
        _ifYouDoNot = ifYouDoNot;

  factory _$MotivationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotivationImplFromJson(json);

  final List<Process> _recyclingProcess;
  @override
  List<Process> get recyclingProcess {
    if (_recyclingProcess is EqualUnmodifiableListView)
      return _recyclingProcess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recyclingProcess);
  }

  final List<Expect> _time;
  @override
  List<Expect> get time {
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_time);
  }

  final List<Process> _ifYouDoNot;
  @override
  List<Process> get ifYouDoNot {
    if (_ifYouDoNot is EqualUnmodifiableListView) return _ifYouDoNot;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ifYouDoNot);
  }

  @override
  String toString() {
    return 'Motivation(recyclingProcess: $recyclingProcess, time: $time, ifYouDoNot: $ifYouDoNot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotivationImpl &&
            const DeepCollectionEquality()
                .equals(other._recyclingProcess, _recyclingProcess) &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            const DeepCollectionEquality()
                .equals(other._ifYouDoNot, _ifYouDoNot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recyclingProcess),
      const DeepCollectionEquality().hash(_time),
      const DeepCollectionEquality().hash(_ifYouDoNot));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MotivationImplCopyWith<_$MotivationImpl> get copyWith =>
      __$$MotivationImplCopyWithImpl<_$MotivationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotivationImplToJson(
      this,
    );
  }
}

abstract class _Motivation implements Motivation {
  const factory _Motivation(
      {required final List<Process> recyclingProcess,
      required final List<Expect> time,
      required final List<Process> ifYouDoNot}) = _$MotivationImpl;

  factory _Motivation.fromJson(Map<String, dynamic> json) =
      _$MotivationImpl.fromJson;

  @override
  List<Process> get recyclingProcess;
  @override
  List<Expect> get time;
  @override
  List<Process> get ifYouDoNot;
  @override
  @JsonKey(ignore: true)
  _$$MotivationImplCopyWith<_$MotivationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
