// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disposalInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DisposalInfo _$$_DisposalInfoFromJson(Map<String, dynamic> json) =>
    _$_DisposalInfo(
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
      time: json['time'] as String,
    );

Map<String, dynamic> _$$_DisposalInfoToJson(_$_DisposalInfo instance) =>
    <String, dynamic>{
      'days': instance.days,
      'time': instance.time,
    };
