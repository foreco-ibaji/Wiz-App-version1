import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/model/disposal/disposalInfo.dart';
import 'package:ibaji/modules/detail_method/widget/detail_widget.dart';
import 'package:ibaji/modules/search/view/search_view.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:ibaji/util/global_button_widget.dart';

import '../../../provider/api/trash_api.dart';
import '../../../util/routes/pages.dart';
import '../../../util/routes/routes.dart';
import '../controller/detail_method_controller.dart';

class DetailMethodScreen extends GetView<DetailMethodController> {
  const DetailMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(DetailMethodController());
    var detailMethod = controller.detailMethod.value;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary6,
          elevation: 0.0,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset("asset/image/icon/ic_home_24.svg"),
              onPressed: () {
                Get.to(() => SearchScreen());
              },
            ),
          ],
        ),
        body: Obx(() => ListView(
              controller: controller.scrollController.value,
              shrinkWrap: true,
              children: [
                //1. header
                Container(
                  padding: EdgeInsets.only(bottom: 40.h),
                  color: AppColors.primary6,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.network(
                        controller.detailMethod.value.iconUrl,
                        width: 160.w,
                      ),
                      Text(
                        controller.detailMethod.value.name,
                        style: AppTextStyles.heading1Bold
                            .copyWith(color: AppColors.grey1),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        "동대문구 전농1동 기준 배출 방법",
                        style: AppTextStyles.title3Medium
                            .copyWith(color: AppColors.grey1),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "asset/image/icon/ic_trash_can_36.png",
                            width: 24.w,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            '쓰레기 배출 방법',
                            style: AppTextStyles.heading3Bold,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.grey1),
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 30.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "이렇게 버려주세요",
                              style: AppTextStyles.title3SemiBold
                                  .copyWith(color: AppColors.grey4),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(controller.detailMethod.value.disposalMethod,
                                style: AppTextStyles.title1Bold),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.h),
                              child: Divider(
                                color: AppColors.grey2,
                                thickness: 1.h,
                              ),
                            ),
                            controller.detailMethod.value.remark.isNotEmpty
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "유의해주세요",
                                        style: AppTextStyles.title3SemiBold
                                            .copyWith(color: AppColors.grey4),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: controller
                                              .detailMethod.value.remark.length,
                                          itemBuilder: ((context, index) {
                                            return DisposalMethod(
                                                index: index + 1,
                                                content: controller.detailMethod
                                                    .value.remark[index]);
                                          })),
                                    ],
                                  )
                                : SizedBox.shrink(),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      controller.detailMethod.value.detailType == "BASIC"
                          ? DisposalDayContainer()
                          : controller.detailMethod.value.detailType == "BIG"
                              ? BigTrashCatuion()
                              : SizedBox.shrink(),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "asset/image/icon/ic_question_24.png",
                            width: 24.w,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '이런 쓰레기는 어떻게 버리나요?',
                            style: AppTextStyles.title1SemiBold,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      controller.relationTrash.isNotEmpty
                          ? SizedBox(
                              height: 210.h,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.relationTrash.length,
                                  itemBuilder: ((context, index) {
                                    return DetailVerticalContainer(
                                      trash: controller.relationTrash[index],
                                    );
                                  })),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                ),
              ],
            )),
        bottomNavigationBar: controller.detailMethod.value.detailType == "MAP"
            ? MapNavigationBottomSheet()
            : null,
      ),
    );
  }

  Widget BigTrashCatuion() {
    return Column(children: [
      SizedBox(
        height: 40.h,
      ),
      Row(
        children: [
          Image.asset(
            "asset/image/icon/ic_report_26.png",
            width: 26.w,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            '신고하는 곳',
            style: AppTextStyles.heading3Bold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      SizedBox(
        height: 24.h,
      ),
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: AppColors.grey1),
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "이렇게 신고해주세요",
              style:
                  AppTextStyles.title3SemiBold.copyWith(color: AppColors.grey4),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "대형 생활 폐기물은 주민센터, 구청 등의 지자체에 신고 후 (웹사이트 또는 직접 방문) 폐기물 스티커를 인쇄하거나 발급받아 집 밖으로 옮겨두면 폐기물 수거 업체에서 1-2일 내에 수거해 갑니다.",
              style:
                  AppTextStyles.title2Medium.copyWith(color: AppColors.grey8),
            ),
            SizedBox(
              height: 30.h,
            ),
            GlobalButton.moveReportBigTrash()
          ]))
    ]);
  }

  Widget DisposalDayContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              "asset/image/icon/ic_calender_28.png",
              width: 24.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              '쓰레기 배출 요일',
              style: AppTextStyles.heading2Bold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        Container(
            width: 335.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.grey1),
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '배출 요일',
                      style: AppTextStyles.title2SemiBold,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Wrap(
                      children: controller
                          .detailMethod.value.disposalInfoDto.days
                          .map<Widget>((day) => DispoalDayChip(day: day))
                          .toList(),
                    )
                  ],
                ),
                VerticalDivider(
                  thickness: 1,
                  color: AppColors.grey2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '배출 일시',
                      style: AppTextStyles.title2SemiBold,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    controller.detailMethod.value.disposalInfoDto.time == ""
                        ? SizedBox.shrink()
                        : RecycleTextChip.time(
                            startTime: controller
                                .detailMethod.value.disposalInfoDto.time
                                .split('~')[0],
                            endTime: controller
                                .detailMethod.value.disposalInfoDto.time
                                .split('~')[1])
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
