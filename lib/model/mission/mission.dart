import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mission.freezed.dart';
part 'mission.g.dart';

@freezed
class Mission with _$Mission {
  const factory Mission({
    required int id,
    required String kind,
    required String title,
    required String description,
    required String difficulty,
    required int rewardPoint,
    required int totalCount,
    required int totalNumberOfParticipating,
    required int personalParticipatingCount,
    required int personalCount,
    required String iconUrl,
    required String? missionUrl,
  }) = _Mission;
  factory Mission.fromJson(Map<String, dynamic> json) => _$MissionFromJson(json);
}

@freezed
class MissionInfo with _$MissionInfo {
  const factory MissionInfo({
    required int rewardPoint,
    required String title,
    required String description,
    required int personalParticipatingCount,
    required int personalCount,
  }) = _MissionInfo;
  factory MissionInfo.fromJson(Map<String, dynamic> json) => _$MissionInfoFromJson(json);
}