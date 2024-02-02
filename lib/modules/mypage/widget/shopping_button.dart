import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';

class ShoppingButton extends StatelessWidget {
  const ShoppingButton(
      {super.key,
      required this.iconUrl,
      required this.title,
      required this.content});

  final String iconUrl;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary1, borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
      child: Row(
        children: [
          SvgPicture.asset(iconUrl),
          SizedBox(
            width: 16.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.title2SemiBold,
              ),
              Text(
                content,
                style: AppTextStyles.title3Medium,
              )
            ],
          )
        ],
      ),
    );
  }
}
