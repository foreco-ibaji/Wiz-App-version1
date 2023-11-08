import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../app_colors.dart';

class CommonSkeleton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRaidus;
  final Color color;

  const CommonSkeleton(
      {super.key,
      required this.width,
      required this.height,
      required this.borderRaidus,
      this.color = AppColors.grey1});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: color,
      highlightColor: AppColors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRaidus.r),
            color: AppColors.grey1),
      ),
    );
  }

  factory CommonSkeleton.image() {
    return CommonSkeleton(
      width: 160.w,
      height: 160.h,
      borderRaidus: 10,
      color: AppColors.primary6,
    );
  }

  factory CommonSkeleton.missionImg() {
    return CommonSkeleton(
      width: 160.w,
      height: 160.h,
      borderRaidus: 10,
      color: AppColors.grey1,
    );
  }
}
