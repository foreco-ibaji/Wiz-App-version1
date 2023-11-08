// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disposalInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisposalInfoImpl _$$DisposalInfoImplFromJson(Map<String, dynamic> json) =>
    _$DisposalInfoImpl(
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
      time: json['time'] as String,
    );

Map<String, dynamic> _$$DisposalInfoImplToJson(_$DisposalInfoImpl instance) =>
    <String, dynamic>{
      'days': instance.days,
      'time': instance.time,
    };
