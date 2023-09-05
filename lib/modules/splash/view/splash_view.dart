import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';

import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "asset/image/logo/logo.png",
                width: 146.w,
              ),
              SizedBox(
                height: 24.h,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: '위치기반',
                        style: AppTextStyles.title1Bold
                            .copyWith(color: AppColors.primary7)),
                    TextSpan(
                      text: '과',
                      style: AppTextStyles.title1Medium,
                    ),
                    TextSpan(
                        text: '이미지',
                        style: AppTextStyles.title1Bold
                            .copyWith(color: AppColors.primary7)),
                    TextSpan(
                      text: '로\n쓰레기 ',
                      style: AppTextStyles.title1Medium,
                    ),
                    TextSpan(
                        text: '분리배출',
                        style: AppTextStyles.title1Bold
                            .copyWith(color: AppColors.primary7)),
                    TextSpan(
                      text: '을 함께 알아보자',
                      style: AppTextStyles.title1Medium,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
