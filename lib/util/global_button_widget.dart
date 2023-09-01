import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:logger/logger.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final int horizontalPadding;
  final int verticalPadding;
  final Color backgroundColor;
  final Future<void> Function()? onTap;
  const GlobalButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.backgroundColor,
    required this.onTap,
    required this.horizontalPadding,
    required this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding.w, vertical: verticalPadding.h),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(8.r)),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }

  ///위치 수정 버튼 component
  factory GlobalButton.editLocation({onTap}) {
    //TODO: onTap함수 작성
    //1. 위치 함수 호출
    //2. home screen data get api 호출
    return GlobalButton(
        text: "위치 수정",
        textStyle: AppTextStyles.body2Bold.copyWith(color: AppColors.primary6),
        horizontalPadding: 14,
        verticalPadding: 8,
        backgroundColor: AppColors.grey1,
        onTap: onTap);
  }

  ///배출 방법 상세페이지 이동 버튼 component
  factory GlobalButton.moveDetailScreen({onTap}) {
    //TODO: onTap함수 작성
    //Get.toNamed(parameter)
    return GlobalButton(
        text: "배출 방법 보기",
        textStyle:
            AppTextStyles.body2SemiBold.copyWith(color: AppColors.primary7),
        horizontalPadding: 10,
        verticalPadding: 6,
        backgroundColor: Color(0x1A77FFF7),
        onTap: onTap);
  }

  ///배출 방법 상세페이지 이동 버튼 component
  factory GlobalButton.moveDetailScreeninDetail({onTap}) {
    //TODO: onTap함수 작성
    //Get.toNamed(parameter)
    return GlobalButton(
        text: "배출 방법 보기",
        textStyle:
            AppTextStyles.body2SemiBold.copyWith(color: AppColors.primary7),
        horizontalPadding: 30,
        verticalPadding: 6,
        backgroundColor: Color(0x1A77FFF7),
        onTap: onTap);
  }

  ///배출 방법 상세페이지 이동 버튼 component
  factory GlobalButton.moveMotivationPage(
      {required int id, required String name}) {
    //Get.toNamed(parameter)
    return GlobalButton(
        text: "재활용 과정 보기",
        textStyle: AppTextStyles.title3Bold.copyWith(color: AppColors.grey9),
        horizontalPadding: 16,
        verticalPadding: 8,
        backgroundColor: AppColors.primary7,
        onTap: () async {
          Logger().d(Get.previousRoute);
        });
  }
}
