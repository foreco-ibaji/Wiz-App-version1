import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibaji/util/app_text_styles.dart';

import '../../../util/app_colors.dart';
import '../../../util/global_variables.dart';
import '../../../util/widget/global_chip.dart';

class MissionListTile extends StatelessWidget {
  const MissionListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 64.h,
          width: 64.h,
          decoration: const BoxDecoration(
              color: AppColors.grey1, shape: BoxShape.circle),
          alignment: Alignment.center,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "이름",
                  style: AppTextStyles.title2SemiBold.copyWith(
                    color: AppColors.grey9,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                TextChip.missionLevel(level: "하")
              ],
            ),
            Text(
              "이름",
              style: AppTextStyles.body1SemiBold.copyWith(
                color: AppColors.grey7,
              ),
            ),
            Row(
              children: [
                MissionInfo(
                  iconDir: "money",
                  value: "2000",
                ),
                SizedBox(
                  width: 8.w,
                ),
                MissionInfo(
                  iconDir: "count",
                  value: "1/100 참여중",
                ),
              ],
            ),
            TextChip.missionDefault()
          ],
        ),
      ],
    );
  }

  Widget MissionInfo({
    required String iconDir,
    required String value,
  }) {
    return Row(
      children: [
        SvgPicture.asset("${iconDir}ic_mission_${iconDir}.svg"),
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
