// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailMethod _$$_DetailMethodFromJson(Map<String, dynamic> json) =>
    _$_DetailMethod(
      id: json['id'] as int,
      detailType: json['detailType'] as String,
      name: json['name'] as String,
      disposalMethod: json['disposalMethod'] as String,
      disposalInfoDto: DisposalInfo.fromJson(
          json['disposalInfoDto'] as Map<String, dynamic>),
      remark:
          (json['remark'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_DetailMethodToJson(_$_DetailMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'detailType': instance.detailType,
      'name': instance.name,
      'disposalMethod': instance.disposalMethod,
      'disposalInfoDto': instance.disposalInfoDto,
      'remark': instance.remark,
    };
