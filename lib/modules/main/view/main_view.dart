import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/camera/view/camera_view.dart';
import 'package:ibaji/modules/home/view/home_view.dart';
import 'package:ibaji/modules/mission/view/mission_view.dart';
import '../../../util/app_colors.dart';
import '../../../util/app_text_styles.dart';
import '../../../util/global_variables.dart';
import '../controller/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: [
          HomeScreen(),
          CameraScreen(),
          MissionScreen()
        ][controller.selectIdx.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: controller.selectIdx.value,
          onTap: ((value) async {
            controller.selectIdx.value = value;
          }),
          selectedItemColor: AppColors.grey9,
          unselectedItemColor: AppColors.grey2,
          selectedLabelStyle: AppTextStyles.title2Bold,
          unselectedLabelStyle:
              AppTextStyles.title2Bold.copyWith(color: AppColors.grey3),
          items: [
            bottomNaviItem(iconUrl: 'home', naviText: '홈'),
            bottomNaviItem(iconUrl: 'camera', naviText: '카메라'),
            bottomNaviItem(iconUrl: 'mission', naviText: "미션"),
          ],
        ),
      ),
    );
  }
}

BottomNavigationBarItem bottomNaviItem({
  required String iconUrl,
  required String naviText,
}) {
  return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "${iconDir}ic_bottom_${iconUrl}_32.svg",
        height: 32.h,
      ),

      backgroundColor: AppColors.white,
      label: naviText);
}
