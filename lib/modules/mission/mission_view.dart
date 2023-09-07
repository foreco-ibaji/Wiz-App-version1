import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../camera/view/camera_view.dart';
import '../home/view/home_view.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("준비중인 기능입니다")),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        //TODO: 고정값없이 컨텐츠 크기만큼 차지하도록
        height: 105.h,
        padding: EdgeInsets.symmetric(horizontal: 63.w, vertical: 15.h)
            .copyWith(bottom: 22.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.r),
            topRight: Radius.circular(36.r),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 4.h),
                blurRadius: 6.r,
                spreadRadius: 3.r),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNaviItem(
              iconText: "home",
              text: "홈",
              isSelected: true,
              onNavigate: () async {
                // await Get.to(() => DetailMethodScreen(), arguments: {"id": 1});
                await Get.to(
                  () => HomeScreen(),
                );
              },
            ),
            BottomNaviItem(
              iconText: "camera",
              text: "카메라",
              isSelected: false,
              onNavigate: () async {
                // await Get.to(() => DetailMethodScreen(), arguments: {"id": 1});
                await Get.to(
                  () => CameraScreen(),
                );
              },
            ),
            BottomNaviItem(
              iconText: "mission",
              text: "미션",
              isSelected: false,
              onNavigate: () async {
                // await Get.to(() => DetailMethodScreen(), arguments: {"id": 1});
              },
            ),
          ],
        ),
      ),
    );
  }
}
