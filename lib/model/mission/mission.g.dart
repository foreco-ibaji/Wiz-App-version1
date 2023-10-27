// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MissionImpl _$$MissionImplFromJson(Map<String, dynamic> json) =>
    _$MissionImpl(
      id: json['id'] as int,
      kind: json['kind'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      difficulty: json['difficulty'] as String,
      rewardPoint: json['rewardPoint'] as int,
      totalCount: json['totalCount'] as int,
      totalNumberOfParticipating: json['totalNumberOfParticipating'] as int,
      personalParticipatingCount: json['personalParticipatingCount'] as int,
      personalCount: json['personalCount'] as int,
      iconUrl: json['iconUrl'] as String,
    );

Map<String, dynamic> _$$MissionImplToJson(_$MissionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'title': instance.title,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'rewardPoint': instance.rewardPoint,
      'totalCount': instance.totalCount,
      'totalNumberOfParticipating': instance.totalNumberOfParticipating,
      'personalParticipatingCount': instance.personalParticipatingCount,
      'personalCount': instance.personalCount,
      'iconUrl': instance.iconUrl,
    };

_$MissionInfoImpl _$$MissionInfoImplFromJson(Map<String, dynamic> json) =>
    _$MissionInfoImpl(
      rewardPoint: json['rewardPoint'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      personalParticipatingCount: json['personalParticipatingCount'] as int,
      personalCount: json['personalCount'] as int,
    );

Map<String, dynamic> _$$MissionInfoImplToJson(_$MissionInfoImpl instance) =>
    <String, dynamic>{
      'rewardPoint': instance.rewardPoint,
      'title': instance.title,
      'description': instance.description,
      'personalParticipatingCount': instance.personalParticipatingCount,
      'personalCount': instance.personalCount,
    };
