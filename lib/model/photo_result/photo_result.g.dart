// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoResultImpl _$$PhotoResultImplFromJson(Map<String, dynamic> json) =>
    _$PhotoResultImpl(
      message: json['message'] as String,
      result: (json['result'] as List<dynamic>)
          .map((e) => ResultDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PhotoResultImplToJson(_$PhotoResultImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'result': instance.result,
    };

_$ResultDetailImpl _$$ResultDetailImplFromJson(Map<String, dynamic> json) =>
    _$ResultDetailImpl(
      name: json['name'] as String,
      coordinate:
          (json['coordinate'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$$ResultDetailImplToJson(_$ResultDetailImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'coordinate': instance.coordinate,
      'id': instance.id,
    };
