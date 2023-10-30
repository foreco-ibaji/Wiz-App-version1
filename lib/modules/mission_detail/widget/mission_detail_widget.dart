import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibaji/util/app_text_styles.dart';

import '../../../util/app_colors.dart';
import '../../../util/global_variables.dart';

Widget AnswerChip({required String text}) {
  return DottedBorder(
      radius: Radius.circular(1000.r),
      child: SizedBox(
        height: 42.h,
        child: Text(
          text,
          style: AppTextStyles.title3Bold.copyWith(color: AppColors.grey4),
        ),
      ));
}

Widget MissionInfoChip(
    {required Color backgroundColor, required String text, String? imgDir}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    decoration: BoxDecoration(
        color: backgroundColor, borderRadius: BorderRadius.circular(32.r)),
    child: Row(
      children: [
        imgDir != null
            ? SizedBox(
                width: 18.h,
                child: SvgPicture.asset(
                  iconDir + "ic_${imgDir}.svg",
                  height: 14.h,
                ))
            : SizedBox.shrink(),
        Text(
          text,
          style: AppTextStyles.body2SemiBold.copyWith(color: AppColors.grey1),
        ),
      ],
    ),
  );
}
