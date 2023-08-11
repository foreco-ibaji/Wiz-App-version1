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
      backgroundColor: AppColors.primary4,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "asset/image/logo/ic_home_logo.png",
                width: 146.w,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "이미지와 바코드로 지구를 구하다",
                style: AppTextStyles.title1Medium,
              ),
            ]),
      ),
    );
  }
}
