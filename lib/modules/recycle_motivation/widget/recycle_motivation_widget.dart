import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibaji/util/app_colors.dart';

import '../../../util/app_text_styles.dart';

class ProcessContainer extends StatelessWidget {
  final int num;
  final String title;
  final String content;
  const ProcessContainer(
      {super.key,
      required this.num,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NumberWidget(
            num: num,
            textColor: AppColors.primary1,
            color: AppColors.primary7,
          ),
          SizedBox(
            width: 7.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.title2Bold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(content,
                    style: AppTextStyles.title3Medium.copyWith(
                      color: AppColors.grey7,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  final int num;
  final Color color;
  final Color textColor;
  const NumberWidget(
      {super.key,
      required this.num,
      this.color = AppColors.black,
      this.textColor = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      width: 22.h,
      height: 22.h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Text(
        textAlign: TextAlign.center,
        "$num",
        style: AppTextStyles.body1SemiBold.copyWith(color: textColor),
      ),
    );
  }
}

class ProblemContainer extends StatelessWidget {
  final int num;
  final String title;
  final String content;

  const ProblemContainer(
      {super.key,
      required this.num,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 26.h),
      margin: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r), color: AppColors.grey9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "asset/image/icon/ic_problem_$num.png",
            width: 90.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            width: 270.w,
            child: Text(
                textAlign: TextAlign.center,
                title,
                style: AppTextStyles.heading2Bold.copyWith(
                  color: AppColors.grey2,
                )),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 311.w,
            child: Text(content,
                style: AppTextStyles.title2Medium.copyWith(
                  color: AppColors.grey2,
                )),
          ),
        ],
      ),
    );
  }
}
