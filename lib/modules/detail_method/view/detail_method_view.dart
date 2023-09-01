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
import '../../../provider/routes/pages.dart';
import '../../../provider/routes/routes.dart';
import '../../category_method/widget/category_method_widget.dart';
import '../controller/detail_method_controller.dart';

class DetailMethodScreen extends GetView<DetailMethodController> {
  const DetailMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailMethodController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary3,
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
      body: Obx(
        () => ListView(
          shrinkWrap: true,
          children: [
            //1. header
            Container(
              padding: EdgeInsets.only(bottom: 40.h),
              color: AppColors.primary3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    "asset/image/icon/iv_달걀_trash_160.png",
                    width: 160.w,
                  ),
                  Text(
                    controller.detailMethod.value.name,
                    style: AppTextStyles.heading1Bold,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "동대문구 전농1동 기준 배출 방법",
                    style: AppTextStyles.title3Medium,
                  )
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
                        style: AppTextStyles.heading2Bold,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "이렇게 버려주세요",
                          style: AppTextStyles.title3Medium,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller
                                .detailMethod?.value.disposalMethod?.length,
                            itemBuilder: ((context, index) {
                              return DisposalMethod(
                                  index: index + 1,
                                  content: controller.detailMethod?.value
                                          .disposalMethod![index] ??
                                      "");
                            })),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          child: Divider(
                            color: AppColors.grey2,
                            thickness: 1.h,
                          ),
                        ),
                        Text(
                          "유의해주세요",
                          style: AppTextStyles.title3Medium,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                controller.detailMethod.value.remark?.length,
                            itemBuilder: ((context, index) {
                              return DisposalMethod(
                                  index: index + 1,
                                  content: controller
                                      .detailMethod.value.remark![index]);
                            })),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
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
                        '배출 요일',
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 20.h),
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
                              ...controller
                                  .detailMethod.value.disposalInfoDto.days
                                  .map((day) => RecycleTextChip.day(day: day))
                                  .toList()
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
                              RecycleTextChip.time(
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
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.relationTrash.length,
                        itemBuilder: ((context, index) {
                          return DetailObjectContainer(
                            image: controller.relationTrash[index].iconUrl,
                            title: controller.relationTrash[index].name,
                          );
                        })),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
