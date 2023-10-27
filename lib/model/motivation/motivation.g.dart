// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motivation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MotivationImpl _$$MotivationImplFromJson(Map<String, dynamic> json) =>
    _$MotivationImpl(
      recyclingProcess: (json['recyclingProcess'] as List<dynamic>)
          .map((e) => Process.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: (json['time'] as List<dynamic>)
          .map((e) => Expect.fromJson(e as Map<String, dynamic>))
          .toList(),
      ifYouDoNot: (json['ifYouDoNot'] as List<dynamic>)
          .map((e) => Process.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MotivationImplToJson(_$MotivationImpl instance) =>
    <String, dynamic>{
      'recyclingProcess': instance.recyclingProcess,
      'time': instance.time,
      'ifYouDoNot': instance.ifYouDoNot,
    };
