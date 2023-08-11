import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/category_method/widget/category_method_widget.dart';
import 'package:ibaji/modules/search/view/search_view.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:ibaji/util/global_button_widget.dart';

import '../../../provider/routes/pages.dart';
import '../../../provider/routes/routes.dart';
import '../controller/category_method_controller.dart';

class CategoryMethodScreen extends GetView<CategoryMethodController> {
  const CategoryMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryMethodController());
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
            icon: Icon(Icons.search),
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
                  Image.network(
                    controller.categoryMethod.value.categoryIcon,
                    width: 160.w,
                  ),
                  Text(
                    controller.categoryMethod.value.categoryName,
                    style: AppTextStyles.heading1Bold,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "asset/image/icon/ic_location_24.svg",
                        width: 24.w,
                      ),
                      Text(
                        "동대문구 전농1동 기준 배출 방법",
                        style: AppTextStyles.title3Medium,
                      ),
                    ],
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
                        width: 10.w,
                      ),
                      Text(
                        '버리는 방법',
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
                                .categoryMethod.value.disposalMethod?.length,
                            itemBuilder: ((context, index) {
                              return DisposalMethod(
                                  index: index + 1,
                                  content: controller.categoryMethod.value
                                      .disposalMethod![index]);
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
                                controller.categoryMethod?.value.remark?.length,
                            itemBuilder: ((context, index) {
                              return DisposalMethod(
                                  index: index + 1,
                                  content: controller.categoryMethod?.value
                                          .remark![index] ??
                                      "");
                            })),
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
                      // height: 196.h,
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
                              ...?controller
                                  .categoryMethod?.value.disposalInfo.days
                                  .map((day) => RecycleTextChip.day(day: day))
                                  .toList()
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: AppColors.white2,
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
                                  startTime: controller.categoryMethod?.value
                                          .disposalInfo.time
                                          .split('~')[0] ??
                                      '',
                                  endTime: controller.categoryMethod?.value
                                          .disposalInfo.time
                                          .split('~')[1] ??
                                      '')
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
                        '그럼 이런 쓰레기는 어떻게 버리나요?',
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
                        scrollDirection: Axis.horizontal,
                        itemCount: controller
                            .categoryMethod.value.recommendCategories?.length,
                        itemBuilder: ((context, index) {
                          return CategoryDetailVerticalWidget(
                              id: controller.categoryMethod.value
                                  .recommendCategories![index].categoryId,
                              image: controller.categoryMethod.value
                                      .recommendCategories![index].iconUrl ??
                                  "",
                              title: controller.categoryMethod.value
                                  .recommendCategories![index].categoryName);
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
