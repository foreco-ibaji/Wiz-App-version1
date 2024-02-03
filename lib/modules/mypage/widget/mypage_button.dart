import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';

class UseInfoButton extends StatelessWidget {
  // 마이페이지의 이용안내에서 사용하는 버튼
  const UseInfoButton(
      {super.key,
      required this.onPressed,
      required this.iconUrl,
      required this.label});

  final String iconUrl;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            shape: const BeveledRectangleBorder(),
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey,
            surfaceTintColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 0,
            minimumSize: Size.fromHeight(24.h),
            alignment: Alignment.centerLeft),
        onPressed: () => onPressed(),
        icon: SvgPicture.asset(
          iconUrl,
          width: 24.w,
          height: 24.h,
        ),
        label: Text(
          label,
          style: AppTextStyles.title2SemiBold.copyWith(color: AppColors.grey7),
        ));
  }
}
