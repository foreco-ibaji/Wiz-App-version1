// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      member: MemberInfo.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'member': instance.member,
    };

_$MemberInfoImpl _$$MemberInfoImplFromJson(Map<String, dynamic> json) =>
    _$MemberInfoImpl(
      memberId: json['memberId'] as String,
    );

Map<String, dynamic> _$$MemberInfoImplToJson(_$MemberInfoImpl instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
    };
