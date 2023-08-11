import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';

class MapBottomContainer extends StatelessWidget {
  final String address;
  const MapBottomContainer({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 319.h,
      color: AppColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '현위치에서 496m',
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            address,
            style: AppTextStyles.heading3SemiBold
                .copyWith(color: AppColors.primary7),
          ),
          Text(
            '폐건전지함은 답십리 초등학교에 설치되어있어요.',
            style: AppTextStyles.title2Regular.copyWith(color: AppColors.grey8),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 110.h,
                    decoration: BoxDecoration(
                        color: AppColors.grey1,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Column(
                      children: [
                        Image.asset(
                          "asset/image/icon/ic_walk_60.png",
                          width: 60.w,
                        ),
                        Text(
                          '걸어서 20분',
                          style: AppTextStyles.title2SemiBold
                              .copyWith(color: AppColors.grey8),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Container(
                    height: 110.h,
                    decoration: BoxDecoration(
                        color: AppColors.grey1,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Column(
                      children: [
                        Image.asset("asset/image/icon/ic_car_40.png",
                            width: 60.w),
                        Text(
                          '차타고 5분',
                          style: AppTextStyles.title2SemiBold
                              .copyWith(color: AppColors.grey8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
