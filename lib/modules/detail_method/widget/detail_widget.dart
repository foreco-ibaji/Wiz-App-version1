import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/detail_method/controller/detail_method_controller.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:ibaji/util/global_button_widget.dart';

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
  final String image;
  final String title;
  const DetailVerticalContainer(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160.w,
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: AppColors.grey1),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(
            image,
            height: 68.h,
          ),
          SizedBox(height: 6.h),
          Text(
            title,
            style: AppTextStyles.title1Bold,
          ),
          SizedBox(height: 20.h),
          GlobalButton.moveDetailScreeninDetail(
            onTap: () async {
              DetailMethodController.to.trash = title;
            },
          )
        ]));
  }
}
