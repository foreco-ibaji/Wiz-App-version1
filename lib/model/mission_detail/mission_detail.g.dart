// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MissionDetailImpl _$$MissionDetailImplFromJson(Map<String, dynamic> json) =>
    _$MissionDetailImpl(
      missionInfo:
          MissionInfo.fromJson(json['missionInfo'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      answer: Answer.fromJson(json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MissionDetailImplToJson(_$MissionDetailImpl instance) =>
    <String, dynamic>{
      'missionInfo': instance.missionInfo,
      'images': instance.images,
      'choices': instance.choices,
      'answer': instance.answer,
    };

_$ChoiceImpl _$$ChoiceImplFromJson(Map<String, dynamic> json) => _$ChoiceImpl(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ChoiceImplToJson(_$ChoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      disposalMethod: json['disposalMethod'] as String,
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'disposalMethod': instance.disposalMethod,
    };
