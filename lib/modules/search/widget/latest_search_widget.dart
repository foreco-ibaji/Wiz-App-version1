import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibaji/model/search_detail/search_detail.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';

class LatestSearch extends StatelessWidget {
  const LatestSearch(
      {super.key,
      required this.latests,
      required this.onClear,
      required this.onRemoveItem});

  final List<SearchDetail> latests;
  final VoidCallback onClear;
  final void Function(int index) onRemoveItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "최근 검색어",
              style: AppTextStyles.title1Bold,
            ),
            GestureDetector(
              onTap: () => onClear(),
              child: Text(
                "전체 삭제",
                style:
                    AppTextStyles.body1Medium.copyWith(color: AppColors.grey4),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Wrap(
          children: [
            for (int i = 0; i < latests.length; ++i)
              Padding(
                padding: EdgeInsets.only(right: 10.w, bottom: 16.h),
                child: LatestSearchItem(
                    index: i, label: latests[i].text, onClick: onRemoveItem),
              )
          ],
        )
      ],
    );
  }
}

class LatestSearchItem extends StatelessWidget {
  const LatestSearchItem(
      {super.key,
      required this.index,
      required this.label,
      required this.onClick});

  final int index;
  final String label;
  final void Function(int index) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
      decoration: BoxDecoration(
          color: AppColors.primary1,
          borderRadius: BorderRadius.circular(1000.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.title3SemiBold
                .copyWith(color: AppColors.primary6),
          ),
          GestureDetector(
            onTap: () => onClick(index),
            child: SizedBox(
              width: 20.w,
              height: 20.h,
              child: const Icon(
                Icons.close,
                color: AppColors.primary4,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
