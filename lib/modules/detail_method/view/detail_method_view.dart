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
                      controller.detailMethod.value.trashIcon ?? "",
                      width: 160.w,
                    ),
                    Text(
                      controller.detailMethod.value.trashName ?? '',
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
                    // Container(
                    //   margin: EdgeInsets.only(top: 24.h),
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 40.h,
                    //   child: ListView.builder(
                    //       itemCount: controller.titleList.length,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: ((context, index) {
                    //         return GestureDetector(
                    //           onTap: (() async {
                    //             controller.currentIdx.value = index;
                    //             controller.detailMethod.value =
                    //                 await TrashRepository.getDetailMethod(
                    //                     name: controller
                    //                             .detailMethod.value.trashName ??
                    //                         "",
                    //                     tab: index);
                    //           }),
                    //           child: Container(
                    //             margin: EdgeInsets.only(right: 5.w),
                    //             decoration: BoxDecoration(
                    //               color: controller.currentIdx.value == index
                    //                   ? AppColors.grey2
                    //                   : AppColors.grey2.withOpacity(0.4),
                    //               borderRadius: BorderRadius.circular(1000.r),
                    //             ),
                    //             padding: EdgeInsets.symmetric(
                    //                 horizontal: 16.w, vertical: 6.h),
                    //             child: Row(
                    //               children: [
                    //                 Image.asset(
                    //                   index == 0
                    //                       ? 'asset/image/icon/ic_able_160.png'
                    //                       : 'asset/image/icon/ic_unable_160.png',
                    //                   width: 16.w,
                    //                 ),
                    //                 SizedBox(
                    //                   width: 4.w,
                    //                 ),
                    //                 Text(
                    //                   controller.titleList[index],
                    //                   style: AppTextStyles.body1SemiBold
                    //                       .copyWith(
                    //                           color:
                    //                               controller.currentIdx.value ==
                    //                                       index
                    //                                   ? AppColors.white
                    //                                   : AppColors.grey9),
                    //                   textAlign: TextAlign.center,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       })),
                    // ),
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
                    controller.detailMethod.value.plasticInfo == null
                        ? Container(
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
                                  style: AppTextStyles.title3Medium,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.detailMethod?.value
                                        .disposalMethod?.length,
                                    itemBuilder: ((context, index) {
                                      return DisposalMethod(
                                          index: index + 1,
                                          content: controller
                                                  .detailMethod
                                                  ?.value
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .detailMethod.value.remark?.length,
                                    itemBuilder: ((context, index) {
                                      return DisposalMethod(
                                          index: index + 1,
                                          content: controller.detailMethod.value
                                              .remark![index]);
                                    })),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: ((context, index) {
                              return Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
                                  child: ExpansionTile(
                                    title: Text(
                                      controller.detailMethod.value
                                              .plasticInfo![index].name ??
                                          "",
                                      style: AppTextStyles.title1SemiBold
                                          .copyWith(color: AppColors.grey9),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_downward,
                                      color: AppColors.white,
                                    ),
                                    children: List.generate(
                                        2,
                                        (index) => Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: AppColors.grey1),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 18.w,
                                                  vertical: 30.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "이렇게 버려주세요",
                                                    style: AppTextStyles
                                                        .title3Medium,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  ListView.builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount: controller
                                                          .detailMethod
                                                          .value
                                                          .plasticInfo![index]
                                                          .disposalMethod!
                                                          .length,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        return DisposalMethod(
                                                            index: index,
                                                            content: controller
                                                                    .detailMethod
                                                                    .value
                                                                    .plasticInfo![
                                                                        index]
                                                                    .disposalMethod![
                                                                index]);
                                                      })),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 24.h),
                                                    child: Divider(
                                                      color: AppColors.grey2,
                                                      thickness: 1.h,
                                                    ),
                                                  ),
                                                  Text(
                                                    "유의해주세요",
                                                    style: AppTextStyles
                                                        .title3Medium,
                                                  ),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                  ListView.builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemCount: controller
                                                          .detailMethod
                                                          .value
                                                          .plasticInfo![index]
                                                          .remark!
                                                          .length,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        return DisposalMethod(
                                                            index: index,
                                                            content: controller
                                                                .detailMethod
                                                                .value
                                                                .plasticInfo![
                                                                    index]
                                                                .remark![index]);
                                                      })),
                                                  controller
                                                          .detailMethod
                                                          .value
                                                          .plasticInfo![index]
                                                          .examples!
                                                          .isNotEmpty
                                                      ? Column(children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        24.h),
                                                            child: Divider(
                                                              color: AppColors
                                                                  .grey2,
                                                              thickness: 1.h,
                                                            ),
                                                          ),
                                                          Text(
                                                            "기타 플라스틱의 종류",
                                                            style: AppTextStyles
                                                                .title3Medium,
                                                          ),
                                                          Row(
                                                            children:
                                                                List.generate(
                                                              controller
                                                                  .detailMethod
                                                                  .value
                                                                  .plasticInfo![
                                                                      index]
                                                                  .examples!
                                                                  .length,
                                                              (i) => Expanded(
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          12.w,
                                                                      vertical:
                                                                          17.h),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.r),
                                                                    color: AppColors
                                                                        .grey2,
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      CircleAvatar(
                                                                        backgroundImage: NetworkImage(controller
                                                                            .detailMethod
                                                                            .value
                                                                            .plasticInfo![index]
                                                                            .examples![i]
                                                                            .imgUrl),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10.h),
                                                                      Text(
                                                                          controller.detailMethod.value.plasticInfo![index].name ??
                                                                              "",
                                                                          style: AppTextStyles
                                                                              .title3SemiBold
                                                                              .copyWith(
                                                                            color:
                                                                                AppColors.grey9,
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ])
                                                      : SizedBox.shrink(),
                                                  SizedBox(
                                                    height: 20.h,
                                                  ),
                                                ],
                                              ),
                                            )),
                                  ));
                            }),
                            itemCount: controller
                                .detailMethod.value.plasticInfo!.length,
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
                                ...?controller
                                    .detailMethod?.value.disposalInfo?.days
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
                                    startTime: controller.detailMethod?.value
                                            .disposalInfo?.time
                                            .split('~')[0] ??
                                        '',
                                    endTime: controller.detailMethod?.value
                                            .disposalInfo?.time
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
                        controller.detailMethod.value.isRecyclable ==
                                "ISRECYCLEABLE"
                            ? Image.asset(
                                "asset/image/icon/ic_recycle_able.png",
                                width: 24.w,
                              )
                            : Image.asset(
                                "asset/image/icon/ic_recycle_unable.png",
                                width: 24.w,
                              ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          controller.detailMethod.value.isRecyclable ==
                                  "ISRECYCLEABLE"
                              ? "재활용이 가능한 ${controller.detailMethod.value.trashName}"
                              : "재활용이 불가능한 ${controller.detailMethod.value.trashName}",
                          style: AppTextStyles.heading2Bold,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            controller.detailMethod.value.examples!.length,
                        itemBuilder: ((context, index) {
                          return DetailObjectContainer(
                            image: controller
                                .detailMethod.value.examples![index].imgUrl,
                            title: controller.detailMethod?.value
                                    .examples![index].trashName ??
                                "",
                            description: controller.detailMethod?.value
                                    .examples![index].disposalMethod ??
                                "",
                          );
                        })),
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
                              .detailMethod.value.recommendTrashes.length,
                          itemBuilder: ((context, index) {
                            return DetailVerticalContainer(
                                image: controller.detailMethod?.value
                                        .recommendTrashes[index].iconUrl ??
                                    "",
                                title: controller.detailMethod?.value
                                        .recommendTrashes[index].name ??
                                    "");
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
        bottomNavigationBar: controller.detailMethod?.value.isRecyclable ==
                "ISRECYCLEABLE"
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h)
                    .copyWith(bottom: 0),
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r))),
                height: 120.h,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '내가 버린 페트병,\n 어떻게 재활용 될까요?',
                            style: AppTextStyles.title2SemiBold,
                          ),
                          GlobalButton.moveMotivationPage(
                              id: controller.detailMethod.value.id ?? 0,
                              name: controller.detailMethod.value.trashName ??
                                  ""),
                        ]),
                    SizedBox(height: 28.h),
                    Image.asset(
                      "asset/image/icon/ic_bottom_modal_13.png",
                      width: 135.w,
                    )
                  ],
                ),
              )
            : null);
  }
}
