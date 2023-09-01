import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:ibaji/modules/category_method/view/category_method_view.dart';
import 'package:ibaji/modules/search/view/search_view.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:ibaji/util/global_button_widget.dart';
import 'package:logger/logger.dart';

import '../../../provider/api/trash_api.dart';
import '../../../provider/routes/pages.dart';
import '../../../provider/routes/routes.dart';
import '../../detail_method/view/detail_methd_pet_view.dart';
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
                  Center(
                    child: Image.asset(
                      "asset/image/logo/ic_home_logo.png",
                      width: 49.w,
                    ),
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                  //1. 위치 수정
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: '동대문구 전농1동',
                                style: AppTextStyles.heading2Bold
                                    .copyWith(color: AppColors.primary7)),
                            TextSpan(
                              text: ' 주민님,\n오늘도 이바지하세요!',
                              style: AppTextStyles.heading2Bold,
                            ),
                          ],
                        ),
                      ),
                      GlobalButton.editLocation()
                    ],
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  //2. 검색 section
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SearchScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 13.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: AppColors.grey1,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "찾으시는 쓰레기가 있으신가요?",
                            style: AppTextStyles.title3Medium
                                .copyWith(color: AppColors.grey7),
                          ),
                          SvgPicture.asset("asset/image/icon/ic_search_24.svg"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '전농1동 주민',
                            style: AppTextStyles.heading3SemiBold
                                .copyWith(color: AppColors.primary7)),
                        TextSpan(
                          text: '들이 자주 찾는 쓰레기',
                          style: AppTextStyles.heading3SemiBold,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '헷갈리는 쓰레기 배출 정보를 내가 사는 동네에 맞게 알아봐요!',
                    style: AppTextStyles.title3Medium.copyWith(
                      color: AppColors.grey5,
                      letterSpacing: -0.05,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GridView.count(
                      childAspectRatio: 66 / 95,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      crossAxisSpacing: 24.w,
                      mainAxisSpacing: 36.h,
                      shrinkWrap: true,
                      children: List.generate(
                          controller.frequentTrashText.length,
                          (index) => GestureDetector(
                                onTap: (() {
                                  // Get.toNamed('/home/detail', arguments: {
                                  //   'trash': controller.frequentTrashText.keys
                                  //       .elementAt(index)
                                  // });
                                  Get.to(() => DetailMethodPetScreen());
                                }),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageWithCircle(
                                      size: 66,
                                      imagePath: controller
                                          .frequentTrashText.values
                                          .elementAt(index),
                                      backgroundColor: AppColors.grey1,
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Text(
                                      controller.frequentTrashText.keys
                                          .elementAt(index),
                                      style: AppTextStyles.title3Regular
                                          .copyWith(color: AppColors.grey7),
                                    )
                                  ],
                                ),
                              ))),
                  SizedBox(
                    height: 70.h,
                  ),

                  ///분리 배출 캘린더
                  Text(
                    "전농1동 분리배출 캘린더",
                    style: AppTextStyles.heading3SemiBold,
                  ),
                  Text(
                    "요일별로 우리 동네 배출 쓰레기 정보를 알려드려요",
                    style: AppTextStyles.title3Medium
                        .copyWith(color: AppColors.grey5),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.r),
                        color: AppColors.grey1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (() async {
                            if (controller.currentDayIdx.value != 0) {
                              controller.currentDayIdx.value -= 1;
                              var tmpList = await TrashRepository.getCalendar(
                                  controller.dayList[
                                          controller.currentDayIdx.value] +
                                      '요일');
                              controller.trashDay.assignAll(tmpList);
                            }
                          }),
                          child: SvgPicture.asset(
                            "asset/image/icon/ic_arrow_left_14.svg",
                            color: controller.currentDayIdx.value == 0
                                ? Color(0X33F4F5F5)
                                : AppColors.grey9,
                          ),
                        ),
                        Text(
                          "${controller.dayList[controller.currentDayIdx.value]}요일",
                          style: AppTextStyles.title2SemiBold,
                        ),
                        GestureDetector(
                          onTap: (() async {
                            if (controller.currentDayIdx.value != 6) {
                              controller.currentDayIdx.value += 1;
                              var tmpList = await TrashRepository.getCalendar(
                                  controller.dayList[
                                          controller.currentDayIdx.value] +
                                      '요일');
                              controller.trashDay.assignAll(tmpList);
                            }
                          }),
                          child: SvgPicture.asset(
                              "asset/image/icon/ic_arrow_right_14.svg",
                              color: controller.currentDayIdx.value == 6
                                  ? Color(0X33F4F5F5)
                                  : AppColors.grey9),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 23.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: AppColors.grey9,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.trashDay.isEmpty
                            ? RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '버릴 수 있는',
                                        style: AppTextStyles.title1SemiBold),
                                    TextSpan(
                                      text: '쓰레기 품목이 없어요',
                                      style: AppTextStyles.title1SemiBold
                                          .copyWith(color: AppColors.primary7),
                                    ),
                                  ],
                                ),
                              )
                            : RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '모든 쓰레기 품목',
                                      style: AppTextStyles.title1SemiBold
                                          .copyWith(color: AppColors.primary7),
                                    ),
                                    TextSpan(
                                        text: '을 버릴 수 있어요',
                                        style: AppTextStyles.title1SemiBold),
                                  ],
                                ),
                              ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Divider(
                          color: AppColors.grey1,
                          thickness: 1.h,
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Column(
                          children: List.generate(
                              controller.trashDay.length,
                              (index) => Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ImageWithNetworkCircle(
                                                imagePath: controller
                                                        .trashDay[index]
                                                        .iconUrl ??
                                                    "",
                                                backgroundColor:
                                                    Color(0x1AFFFFFF),
                                              ),
                                              SizedBox(
                                                width: 16.w,
                                              ),
                                              Text(
                                                controller.trashDay[index]
                                                    .categoryName,
                                                style: AppTextStyles
                                                    .title2SemiBold
                                                    .copyWith(
                                                        color: AppColors.grey9),
                                              ),
                                            ],
                                          ),
                                          GlobalButton.moveDetailScreen(
                                            onTap: () async {
                                              Logger().d(Get.previousRoute);
                                              await Get.to(
                                                  CategoryMethodScreen(),
                                                  arguments: {
                                                    'category': controller
                                                        .trashDay[index]
                                                  });
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                      )
                                    ],
                                  )),
                        )
                      ],
                    ),
                  )
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
        height: 92.h,
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        padding: EdgeInsets.symmetric(horizontal: 63.w, vertical: 15.h)
            .copyWith(bottom: 22.h),
        decoration: BoxDecoration(
            color: AppColors.grey1, borderRadius: BorderRadius.circular(36.r)),
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
            ),
            BottomNaviItem(
              iconText: "mission",
              text: "미션",
              isSelected: false,
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
