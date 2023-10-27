import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  const factory Member({
    required String accessToken,
    required String refreshToken,
    required MemberInfo member,
  }) = _Member;
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

@freezed
class MemberInfo with _$MemberInfo {
  const factory MemberInfo({
    required String memberId,
  }) = _MemberInfo;
  factory MemberInfo.fromJson(Map<String, dynamic> json) => _$MemberInfoFromJson(json);
}
