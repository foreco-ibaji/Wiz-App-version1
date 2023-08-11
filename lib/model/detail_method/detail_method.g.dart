// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailMethod _$$_DetailMethodFromJson(Map<String, dynamic> json) =>
    _$_DetailMethod(
      orderOfTab: json['orderOfTab'] as int?,
      maxNumOfTab: json['maxNumOfTab'] as int?,
      trashIcon: json['trashIcon'] as String?,
      titleOfTab: json['titleOfTab'] as String?,
      plasticInfo: (json['plasticInfo'] as List<dynamic>?)
          ?.map((e) => PlasticInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      categoryId: json['categoryId'] as int?,
      isRecyclable: json['isRecyclable'] as String?,
      trashName: json['trashName'] as String?,
      disposalMethod: (json['disposalMethod'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      disposalInfo: json['disposalInfo'] == null
          ? null
          : DisposalInfo.fromJson(json['disposalInfo'] as Map<String, dynamic>),
      remark:
          (json['remark'] as List<dynamic>?)?.map((e) => e as String).toList(),
      examples: (json['examples'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendTrashes: (json['recommendTrashes'] as List<dynamic>)
          .map((e) => Trash.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DetailMethodToJson(_$_DetailMethod instance) =>
    <String, dynamic>{
      'orderOfTab': instance.orderOfTab,
      'maxNumOfTab': instance.maxNumOfTab,
      'trashIcon': instance.trashIcon,
      'titleOfTab': instance.titleOfTab,
      'plasticInfo': instance.plasticInfo,
      'id': instance.id,
      'categoryId': instance.categoryId,
      'isRecyclable': instance.isRecyclable,
      'trashName': instance.trashName,
      'disposalMethod': instance.disposalMethod,
      'disposalInfo': instance.disposalInfo,
      'remark': instance.remark,
      'examples': instance.examples,
      'recommendTrashes': instance.recommendTrashes,
    };

_$_PlasticInfo _$$_PlasticInfoFromJson(Map<String, dynamic> json) =>
    _$_PlasticInfo(
      trashIcon: json['trashIcon'] as String?,
      categoryId: json['categoryId'] as int?,
      name: json['name'] as String?,
      disposalMethod: (json['disposalMethod'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      remark:
          (json['remark'] as List<dynamic>?)?.map((e) => e as String).toList(),
      examples: (json['examples'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlasticInfoToJson(_$_PlasticInfo instance) =>
    <String, dynamic>{
      'trashIcon': instance.trashIcon,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'disposalMethod': instance.disposalMethod,
      'remark': instance.remark,
      'examples': instance.examples,
    };
