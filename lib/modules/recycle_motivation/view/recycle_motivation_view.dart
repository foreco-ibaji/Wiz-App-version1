import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:ibaji/util/global_button_widget.dart';

import '../../../provider/routes/pages.dart';
import '../../../provider/routes/routes.dart';
import '../../search/view/search_view.dart';
import '../controller/recycle_motivation_controller.dart';
import '../widget/recycle_motivation_widget.dart';

class RecycleMotivationScreen extends GetView<RecycleMotivationController> {
  const RecycleMotivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary7,
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          final RenderBox renderBox = controller.index01.currentContext
              ?.findRenderObject() as RenderBox;
          final position = renderBox.localToGlobal(Offset.zero);
          controller.scrollController.value.animateTo(
            position.dy,
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
      body: Obx(
        () => ListView(
          shrinkWrap: true,
          controller: controller.scrollController.value,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 22.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '도대체 어떻게\n',
                      style: AppTextStyles.heading1Bold,
                    ),
                    TextSpan(
                        text: '재활용 되길래\n',
                        style: AppTextStyles.heading1Bold
                            .copyWith(color: AppColors.primary7)),
                    TextSpan(
                      text: '분리수거 하라는거에요?',
                      style: AppTextStyles.heading1Bold,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: 350.h,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40.h,
                      left: 22.w,
                      child: Image.asset(
                        "asset/image/icon/ic_text_container_left.png",
                        width: 220.w,
                      ),
                    ),
                    Positioned(
                      top: 120.h,
                      right: 22.w,
                      child: Image.asset(
                        "asset/image/icon/ic_text_container_right.png",
                        width: 220.w,
                      ),
                    ),
                    Positioned(
                      top: 101.h,
                      left: -65.w,
                      child: Image.asset(
                        "asset/image/object/iv_plastic_motivation.png",
                        width: 200.w,
                      ),
                    ),
                    Positioned(
                      top: 179.h,
                      right: 22.w,
                      child: Image.asset(
                        "asset/image/object/iv_motivation_face.png",
                        width: 130.w,
                      ),
                    )
                  ],
                )),
            TabBar(
              controller: controller.motivationTab?.controller,
              onTap: (index) {
                controller.currentIdx.value = index;
                var globalKey = controller.currentIdx.value == 0
                    ? controller.index01
                    : controller.currentIdx.value == 1
                        ? controller.index02
                        : controller.index03;
                final RenderBox renderBox =
                    globalKey.currentContext?.findRenderObject() as RenderBox;
                final position = renderBox.localToGlobal(Offset.zero);
                controller.scrollController.value.animateTo(
                  position.dy,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              isScrollable: true,
              indicatorColor: AppColors.white,
              unselectedLabelColor: AppColors.grey4,
              labelColor: AppColors.white,
              labelStyle: AppTextStyles.title2Bold,
              tabs: List.generate(controller.tabsList.length, ((index) {
                return SizedBox(
                    child: Tab(
                  text: controller.tabsList[index],
                ));
              })),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 64.h,
                  ),
                  Text(
                    key: controller.index01,
                    '01',
                    style: AppTextStyles.heading2Bold
                        .copyWith(color: AppColors.primary7),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "${controller.tmpObject.value}는\n이렇게 재활용돼요.",
                    style: AppTextStyles.heading1Bold,
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          controller.motivation.value.recyclingProcess.length,
                      itemBuilder: ((context, index) {
                        return ProcessContainer(
                            num: index + 1,
                            title: controller
                                .motivation.value.recyclingProcess[index].title,
                            content: controller.motivation.value
                                .recyclingProcess[index].content);
                      })),
                  SizedBox(
                    height: 64.h,
                  ),
                  Text(
                    key: controller.index02,
                    '02',
                    style: AppTextStyles.heading2Bold
                        .copyWith(color: AppColors.primary7),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "분리수거를 잘한다면,\n이런 것을 만들 수 있어요.",
                    style: AppTextStyles.heading1Bold,
                  ),
                  Text(
                    "${controller.tmpObject.value}를 올바르게 분리수거 하셨나요?\n그렇다면 방금 버린 그 ${controller.tmpObject.value}는 재활용 과정을\n거쳐서 이런 물품으로 다시 태어난답니다!",
                    style: AppTextStyles.title1Regular
                        .copyWith(color: AppColors.grey8),
                  ),
                  SizedBox(
                    height: 62.h,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.motivation.value.ifYouDoNot.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                NumberWidget(
                                  num: index + 1,
                                  textColor: AppColors.black,
                                  color: AppColors.white,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  controller
                                      .motivation.value.time[index].imgName,
                                  style: AppTextStyles.heading3SemiBold,
                                )
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                child: Image.asset(
                                  controller
                                      .motivation.value.time[index].imgUrl,
                                  width: MediaQuery.of(context).size.width,
                                )),
                          ],
                        );
                      })),
                  SizedBox(
                    height: 64.h,
                  ),
                  Text(
                    key: controller.index03,
                    '03',
                    style: AppTextStyles.heading2Bold
                        .copyWith(color: AppColors.primary7),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "올바르게\n분리수거 안한다면?",
                    style: AppTextStyles.heading1Bold,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: ((context, index) {
                        return ProblemContainer(
                            num: index + 1,
                            title: controller
                                .motivation.value.ifYouDoNot[index].title,
                            content: controller
                                .motivation.value.ifYouDoNot[index].content);
                      })),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
