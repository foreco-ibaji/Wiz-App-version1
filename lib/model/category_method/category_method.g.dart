// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryMethodImpl _$$CategoryMethodImplFromJson(Map<String, dynamic> json) =>
    _$CategoryMethodImpl(
      categoryName: json['categoryName'] as String,
      categoryIcon: json['categoryIcon'] as String,
      disposalMethod: (json['disposalMethod'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      remark:
          (json['remark'] as List<dynamic>?)?.map((e) => e as String).toList(),
      disposalInfo:
          DisposalInfo.fromJson(json['disposalInfo'] as Map<String, dynamic>),
      recommendCategories: (json['recommendCategories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryMethodImplToJson(
        _$CategoryMethodImpl instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'categoryIcon': instance.categoryIcon,
      'disposalMethod': instance.disposalMethod,
      'remark': instance.remark,
      'disposalInfo': instance.disposalInfo,
      'recommendCategories': instance.recommendCategories,
    };
