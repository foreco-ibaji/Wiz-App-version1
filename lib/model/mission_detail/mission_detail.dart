import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../mission/mission.dart';

part 'mission_detail.freezed.dart';
part 'mission_detail.g.dart';

@freezed
class MissionDetail with _$MissionDetail {
  const factory MissionDetail({
    required MissionInfo missionInfo,
    required List<String> images,
    required List<Choice> choices,
    required Answer answer,
  }) = _MissionDetail;
  factory MissionDetail.fromJson(Map<String, dynamic> json) => _$MissionDetailFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    required int id,
    required String name,
  }) = _Choice;
  factory Choice.fromJson(Map<String, dynamic> json) =>
      _$ChoiceFromJson(json);
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    required int id,
    required String name,
    required String imageUrl,
    required String disposalMethod,
  }) = _Answer;
  factory Answer.fromJson(Map<String, dynamic> json) =>
      _$AnswerFromJson(json);
}