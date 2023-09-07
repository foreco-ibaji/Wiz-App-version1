import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ibaji/modules/camera/view/camera_view.dart';
import 'package:ibaji/modules/detail_method/view/detail_method_view.dart';
import 'package:ibaji/modules/map/view/map_view.dart';
import 'package:ibaji/modules/mission/mission_view.dart';
import 'package:ibaji/modules/search/view/search_view.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:ibaji/util/global_button_widget.dart';
import 'package:logger/logger.dart';

import '../../../provider/api/trash_api.dart';
import '../../../util/routes/pages.dart';
import '../../../util/routes/routes.dart';
import '../../../provider/service/map_service.dart';
import '../../camera/view/camera_result_view.dart';
import '../controller/home_controller.dart';
import '../widget/home_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h).copyWith(
              bottom: 140.h,
            ),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "asset/image/logo/logo.png",
                        width: 53.w,
                      ),
                      GestureDetector(
                        onTap: (() {
                          Get.to(() => MapScreen());
                        }),
                        child: SvgPicture.asset(
                          "asset/image/icon/ic_map_26.svg",
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  //1. 배출요일 캘린더
                  GestureDetector(
                    onTap: () {
                      //TODO: 추후에 클릭시 캘린더 페이지 이동
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          color: AppColors.grey1,
                          borderRadius: BorderRadius.circular(1000.r)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "asset/image/icon/ic_home_calendar_28.svg",
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          //TODO: 데이터가 없을때 예외처리
                          Expanded(
                            child: Text(
                              controller.trashDay.isEmpty
                                  ? "오늘은 버릴 수 있는 쓰레기가 없어요"
                                  : "오늘은 ${controller.trashDay.join(", ")} ",
                              style: AppTextStyles.body1SemiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          !controller.trashDay.isEmpty
                              ? Text(
                                  '버리는 날',
                                  style: AppTextStyles.body1SemiBold,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 86.h,
                  ),
                  //*2. 위치 정보 section
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:
                                '${MapService.currentAddress[1]} ${MapService.currentAddress[2]} 주민',
                            style: AppTextStyles.heading2Bold
                                .copyWith(color: AppColors.primary7)),
                        TextSpan(
                          text: '님,\n어떤 쓰레기를 찾으시나요?',
                          style: AppTextStyles.heading2Bold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "asset/image/icon/ic_location_24.svg",
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(MapService.currentAddress.join(' '),
                          style: AppTextStyles.title3Medium),
                    ],
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  //*3. 검색 section
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SearchScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 23.h, horizontal: 23.w),
                      decoration: BoxDecoration(
                        color: AppColors.grey1,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "궁금한 쓰레기 검색!",
                            style: AppTextStyles.title2Medium
                                .copyWith(color: AppColors.grey3),
                          ),
                          SvgPicture.asset("asset/image/icon/ic_search_24.svg"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
                await Get.to(
                  () => MissionScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNaviItem extends StatelessWidget {
  final String text;
  final String iconText;
  final bool isSelected;
  final Future<void> Function()? onNavigate;
  const BottomNaviItem(
      {super.key,
      required this.text,
      required this.iconText,
      required this.isSelected,
      this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigate,
      child: Column(children: [
        SvgPicture.asset("asset/image/icon/ic_bottom_${iconText}_32.svg"),
        Text(text,
            style: AppTextStyles.title3Bold.copyWith(
                color: isSelected ? AppColors.black : AppColors.grey3))
      ]),
    );
  }
}
