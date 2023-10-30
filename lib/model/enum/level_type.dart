import 'package:flutter/material.dart';
import 'package:ibaji/util/app_colors.dart';

enum LevelStatus {
  //진행중
  LOW("하", AppColors.primary5),
  //시작 전
  MIDDLE("중", AppColors.primary7),
  //마감
  HIGH("상", AppColors.territory);

  final String stateName;
  final Color badeColor;
  const LevelStatus(this.stateName, this.badeColor);
}

const levelStatusMap = {
  "LOW": LevelStatus.LOW,
  "MIDDLE": LevelStatus.MIDDLE,
  "HIGH": LevelStatus.HIGH,
};
