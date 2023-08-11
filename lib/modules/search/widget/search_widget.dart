import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/detail_method/view/detail_method_view.dart';
import 'package:ibaji/modules/home/widget/home_widget.dart';
import 'package:ibaji/util/app_text_styles.dart';

import '../../../util/app_colors.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.to(DetailMethodScreen(), arguments: {'trash': '비닐봉지'});
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: AppColors.grey10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "음식물이 묻은 비닐",
              style: AppTextStyles.title2Medium.copyWith(
                color: AppColors.primary7,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "종량제 봉투에 담아 버려주세요",
              style: AppTextStyles.title2Medium.copyWith(
                color: AppColors.grey3,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 19.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.grey1),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.all(6.w),
                    width: 38.w,
                    height: 38.w,
                    decoration: BoxDecoration(
                      color: AppColors.grey2,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "asset/image/object/iv_plastic_bag_160.png",
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Expanded(
                    child: Text(
                      "비닐봉지 배출방법",
                      style: AppTextStyles.title3Regular.copyWith(
                        color: AppColors.grey7,
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
        ),
      ),
    );
  }
}
