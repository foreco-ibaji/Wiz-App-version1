import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/detail_method/view/detail_method_view.dart';
import 'package:ibaji/modules/home/widget/home_widget.dart';
import 'package:ibaji/util/app_text_styles.dart';

import '../../../model/trash/trash.dart';
import '../../../util/app_colors.dart';

class SearchResult extends StatelessWidget {
  final Trash trash;
  const SearchResult({super.key, required this.trash});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(DetailMethodScreen(), arguments: {'id': trash.id});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 19.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.primary6),
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(6.w),
                width: 38.w,
                height: 38.w,
                decoration: const BoxDecoration(
                  color: AppColors.grey9,
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  trash.iconUrl,
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Expanded(
                child: Text(
                  "${trash.name} 배출방법",
                  style: AppTextStyles.title3SemiBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: AppColors.white,
                size: 20,
              )
            ]),
          ),
        ),
      ],
    );
  }
}
