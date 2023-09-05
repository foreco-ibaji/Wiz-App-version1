import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/detail_method/controller/detail_method_controller.dart';
import 'package:ibaji/modules/detail_method/view/detail_method_view.dart';
import 'package:ibaji/modules/map/view/map_view.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:ibaji/util/global_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:ibaji/util/global_button_widget.dart';
import 'package:logger/logger.dart';

import '../../../model/category/category.dart';
import '../../../model/trash/trash.dart';

class DetailObjectContainer extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const DetailObjectContainer(
      {super.key,
      required this.image,
      required this.title,
      this.description = "배출 방법 보기"});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      width: 335.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r), color: AppColors.grey1),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 40.w,
          ),
          SizedBox(
            width: 18.w,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: AppTextStyles.title2Bold,
              ),
              SizedBox(height: 8.h),
              Text(
                description,
                style: AppTextStyles.title3Medium,
                maxLines: 3,
              )
            ]),
          )
        ],
      ),
    );
  }
}

class DetailVerticalContainer extends StatelessWidget {
  final Trash trash;
  const DetailVerticalContainer({super.key, required this.trash});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 170.w,
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: AppColors.grey1),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(
            trash.iconUrl ??
                "https://postfiles.pstatic.net/MjAyMzAzMDlfMTU1/MDAxNjc4MzQ0OTk4MTMx.bsYYQx3KsbEmFEKxhmXXvH1Vk-dyLjn2-ECxIaKyJdMg.j_V4Zxtoi8ZDVfmORtO7pzshskoycWx3TFwf9zCeeAkg.JPEG.mha0715/IMG%EF%BC%BF20230309%EF%BC%BF122138%EF%BC%BF513.jpg?type=w966",
            height: 68.h,
          ),
          SizedBox(height: 6.h),
          Text(
            trash.name,
            style: AppTextStyles.title1SemiBold,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 20.h),
          GlobalButton.moveDetailScreenDetail(
            onTap: () async {
              Logger().d("click?");
              //TODO route 설정
              await Get.to(() => DetailMethodScreen(),
                  arguments: {'id': trash.id});
              // DetailMethodController.to.trash = title;
            },
          )
        ]));
  }
}

class RecycleTextChip extends StatelessWidget {
  final String text;
  final int horizontalPadding;
  final int verticalPadding;
  final Color textColor;
  const RecycleTextChip(
      {super.key,
      required this.text,
      required this.horizontalPadding,
      required this.verticalPadding,
      this.textColor = AppColors.grey9});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding.w, vertical: verticalPadding.h),
      decoration: BoxDecoration(
          color: Color(0xff303130),
          borderRadius: BorderRadius.circular(1000.r)),
      child: Text(
        text,
        style: AppTextStyles.title3SemiBold.copyWith(color: AppColors.grey1),
      ),
    );
  }

  factory RecycleTextChip.time(
      {required String startTime, required String endTime}) {
    return RecycleTextChip(
      text: "$startTime ~ $endTime",
      horizontalPadding: 18,
      verticalPadding: 4,
    );
  }
}

//

class DisposalMethod extends StatelessWidget {
  final int index;
  final String content;
  const DisposalMethod({super.key, required this.index, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          width: 24.h,
          height: 24.h,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.black),
          child: Text(
            textAlign: TextAlign.center,
            index.toString(),
            style: AppTextStyles.body1SemiBold.copyWith(color: AppColors.grey1),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text(
            content,
            style: AppTextStyles.title2Regular,
            maxLines: 4,
          ),
        )
      ],
    );
  }
}

class DispoalDayChip extends StatelessWidget {
  final String day;
  const DispoalDayChip({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    Map<String, Color> dayWithColor = {
      "월": Color(0xffCAB054),
      "화": Color(0xff54C9AD),
      "수": Color(0xff546EC9),
      "목": Color(0xffC95454),
      "금": Color(0xffA454C9),
      "토": Color(0xff549FC9),
      "일": Color(0xff96C954),
    };
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      width: 34.h,
      height: 34.h,
      //TODO: data 임시 하드코딩
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: dayWithColor[day]),
      child: Text(
        textAlign: TextAlign.center,
        day,
        style: AppTextStyles.title3SemiBold.copyWith(color: AppColors.grey1),
      ),
    );
  }
}

class MapNavigationBottomSheet extends StatelessWidget {
  const MapNavigationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      // width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 27.h, horizontal: 23.w),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 4.h),
                blurRadius: 6.r,
                spreadRadius: 3.r),
          ],
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20.r), right: Radius.circular(20.r)),
          color: AppColors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "우리집 근처에\n 수거함이 어디 있을까?",
                style: AppTextStyles.title2Bold,
              ),
              GlobalButton.moveMapScreen(onTap: () async {
                await Get.to(() => MapScreen());
              })
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          SvgPicture.asset("asset/image/icon/ic_bottom_modal_135.svg")
        ],
      ),
    );
  }
}
