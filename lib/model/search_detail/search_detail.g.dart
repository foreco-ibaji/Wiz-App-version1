// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchDetailImpl _$$SearchDetailImplFromJson(Map<String, dynamic> json) =>
    _$SearchDetailImpl(
      text: json['text'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$SearchDetailImplToJson(_$SearchDetailImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'dateTime': instance.dateTime.toIso8601String(),
    };
