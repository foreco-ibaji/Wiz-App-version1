import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';
import '../app_text_styles.dart';

class TextChip extends StatelessWidget {
  final TextStyle textStyle;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final int borderRadius;
  final int paddingVertical;
  final int paddingHorizontal;

  const TextChip({super.key,
    required this.textStyle,
    required this.textColor,
    required this.backgroundColor,
    required this.borderRadius,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal.w, vertical: paddingVertical.h),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius.r)),
      child: Text(
        text,
        style: textStyle.copyWith(color: textColor),
      ),
    );
  }

  factory TextChip.missionDefault(){
    return TextChip(
      text: "참여 가능 횟수 모두 소진",
      textStyle: AppTextStyles.title3SemiBold,
      textColor: AppColors.grey5,
      backgroundColor: AppColors.grey1,
      borderRadius: 8,
      paddingVertical: 4,
      paddingHorizontal: 16,
    );
  }

  factory TextChip.missionCount({
    required int count,
    required int total
}){
    return TextChip(
      text: "참여 가능 횟수 ${count}/${total}",
      textStyle: AppTextStyles.title3SemiBold,
      textColor: AppColors.primary6,
      backgroundColor: AppColors.primary1,
      borderRadius: 8,
      paddingVertical: 4,
      paddingHorizontal: 16,
    );
  }
  //TODO: 난이도에 따라 색상 변경 <- enum class
  factory TextChip.missionLevel({
    required String level,
  }){
    return TextChip(
      text: "난이도 $level",
      textStyle: AppTextStyles.body2Bold,
      textColor: AppColors.grey1,
      backgroundColor: AppColors.primary1,
      borderRadius: 32,
      paddingVertical: 3,
      paddingHorizontal: 10,
    );
  }
}
