import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/category_method/controller/category_method_controller.dart';
import 'package:ibaji/modules/category_method/view/category_method_view.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:ibaji/util/global_button_widget.dart';

import '../../../model/category/category.dart';

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
          color: AppColors.grey2, borderRadius: BorderRadius.circular(8.r)),
      child: Text(
        text,
        style: AppTextStyles.title3SemiBold.copyWith(color: textColor),
      ),
    );
  }

  factory RecycleTextChip.day({required String day}) {
    return RecycleTextChip(
      text: "$day",
      horizontalPadding: 30,
      verticalPadding: 4,
      textColor: AppColors.primary4,
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

class CategoryDetailVerticalWidget extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  const CategoryDetailVerticalWidget({
    super.key,
    required this.image,
    required this.title,
    required this.id,
  });

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
              Get.to(() => CategoryMethodScreen(), arguments: {
                'category': Category(
                    categoryId: id, categoryName: title, iconUrl: image)
              });
            },
          )
        ]));
  }
}

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
            style: AppTextStyles.body1SemiBold,
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
