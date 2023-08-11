// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motivation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Motivation _$$_MotivationFromJson(Map<String, dynamic> json) =>
    _$_Motivation(
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

Map<String, dynamic> _$$_MotivationToJson(_$_Motivation instance) =>
    <String, dynamic>{
      'recyclingProcess': instance.recyclingProcess,
      'time': instance.time,
      'ifYouDoNot': instance.ifYouDoNot,
    };
