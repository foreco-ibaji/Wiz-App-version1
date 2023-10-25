import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/login/controller/login_controller.dart';

import '../../../util/app_colors.dart';
import '../../../util/global_variables.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("${imgDir}logo/ic_home_logo.png"),
        GestureDetector(
          onTap: () {

          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 53.w),
              decoration: BoxDecoration(
                  color: AppColors.kakao,
                  borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 19.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("${imgDir}logo/ic_login_kakao_18.svg"),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text('카카오로 로그인하기'),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
