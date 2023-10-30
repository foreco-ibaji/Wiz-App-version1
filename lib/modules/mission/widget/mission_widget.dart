import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibaji/provider/api/util/global_mock_data.dart';
import 'package:ibaji/util/app_text_styles.dart';

import '../../../model/enum/level_type.dart';
import '../../../model/mission/mission.dart';
import '../../../util/app_colors.dart';
import '../../../util/global_variables.dart';
import '../../../util/widget/global_chip.dart';

class MissionListTile extends StatelessWidget {
  final Mission mission;

  const MissionListTile({super.key, this.mission = tmpMission});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 64.h,
            width: 64.h,
            decoration: const BoxDecoration(
                color: AppColors.grey1, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Image.network(
              mission.iconUrl,
              height: 24.h,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    mission.title,
                    style: AppTextStyles.title2SemiBold.copyWith(
                      color: AppColors.grey9,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  TextChip.missionLevel(
                      level:
                          levelStatusMap[mission.difficulty]?.stateName ?? "하")
                ],
              ),
              Text(
                mission.description,
                style: AppTextStyles.body1SemiBold.copyWith(
                  color: AppColors.grey7,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  MissionInfo(
                    icon: "money",
                    value: "${mission.rewardPoint}",
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  MissionInfo(
                    icon: "count",
                    value: "${mission.totalNumberOfParticipating}/${mission.totalCount} 참여중",
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              TextChip.missionCount(
                  count: mission.personalParticipatingCount, total: mission.personalCount)
            ],
          ),
        ],
      ),
    );
  }

  Widget MissionInfo({
    required String icon,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "${iconDir}ic_mission_${icon}.svg",
          width: 15.w,
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          value,
          style: AppTextStyles.title3SemiBold.copyWith(
            color: AppColors.grey8,
          ),
        ),
      ],
    );
  }
}
