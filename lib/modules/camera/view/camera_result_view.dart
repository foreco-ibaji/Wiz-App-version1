import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/camera/controller/camera_result_controller.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';

class CameraResultScreen extends GetView<CameraResultController> {
  const CameraResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: 임시 라우팅
    Get.put(CameraResultController());
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    "asset/image/icon/ic_home_back_24.svg",
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                //TODO:그림자,radius
                Image.asset(
                  "asset/image/object/iv_egg_trash_160.png",
                  width: 180.w,
                ),
                SizedBox(
                  height: 42.h,
                ),
                Text(
                  "이렇게 분리배출해주세요",
                  style: AppTextStyles.heading3Bold,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return ResultContainer(
                          image: "Fdfs",
                          title: controller.tmpResult[index][0],
                          description:
                              "이부분은 ${controller.tmpResult[index][0]}로 버려주세요");
                    }),
                    separatorBuilder: ((context, index) {
                      return SizedBox(
                        height: 12.h,
                      );
                    }),
                    itemCount: controller.tmpResult.length)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ResultContainer(
      {required String image,
      required String title,
      required String description}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      width: 335.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r), color: AppColors.grey1),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      child: Row(
        children: [
          // CircleAvatar(
          //   //TODO:crop해서 제공
          //   backgroundImage: AssetImage(image),
          //   radius: 40.w,
          // ),
          //임시 하드코딩
          CircleAvatar(
            //TODO:crop해서 제공
            backgroundImage:
                AssetImage("asset/image/object/iv_egg_trash_160.png"),
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
