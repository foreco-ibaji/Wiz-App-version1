import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';

class RecommendSearch extends StatelessWidget {
  const RecommendSearch({super.key, required this.recommends});

  final List<String> recommends;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "추천 검색어",
          style: AppTextStyles.title1Bold,
        ),
        SizedBox(
          height: 20.h,
        ),
        Wrap(
          children: [
            for (int i = 0; i < recommends.length; ++i)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                child: RecommendSearchItem(label: recommends[i]),
              )
          ],
        ),
      ],
    );
  }
}

class RecommendSearchItem extends StatelessWidget {
  const RecommendSearchItem({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.h, bottom: 6.h, left: 12.w, right: 24.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000.r),
          border: Border.all(color: AppColors.primary4)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "asset/image/icon/ic_search_outline.svg",
            color: AppColors.primary4,
            width: 19.w,
            height: 19.h,
          ),
          SizedBox(
            width: 6.w,
          ),
          Text(label,
              style: AppTextStyles.title3SemiBold
                  .copyWith(color: AppColors.grey8)),
        ],
      ),
    );
  }
}
