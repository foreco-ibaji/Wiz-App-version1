import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../util/app_colors.dart';
import '../../../util/global_button_widget.dart';
import '../../../util/widget/global_chip.dart';
import '../controller/mission_detail_controller.dart';
import '../widget/mission_detail_widget.dart';

class MissionDetailScreen extends GetView<MissionDetailController> {
  const MissionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mission = controller.missionDetail.value;
    return Scaffold(
      backgroundColor: AppColors.primary6,
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 21.w, vertical: 31.h).copyWith(
            bottom: 42.h
          ),
          padding:
              EdgeInsets.symmetric(horizontal: 37.w, vertical: 42.h).copyWith(
            bottom: 21.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///1. missionInfo TextChip
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MissionInfoChip(
                      backgroundColor: AppColors.grey9,
                      text: "${mission.missionInfo.rewardPoint}",
                      imgDir: "mission_money"),
                  SizedBox(
                    width: 6.w,
                  ),
                  MissionInfoChip(
                    backgroundColor: AppColors.primary6,
                    text:
                        "${mission.missionInfo.personalParticipatingCount}/${mission.missionInfo.personalCount} 참여중",
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(mission.missionInfo.title,
                  style: AppTextStyles.heading2Bold),
              SizedBox(
                height: 4.h,
              ),
              Text(mission.missionInfo.description,
                  style: AppTextStyles.title2SemiBold.copyWith(
                    color: AppColors.grey5,
                  )),
              SizedBox(
                height: 36.h,
              ),

              ///*2. missionInfo Image
              SizedBox(
                width: 260.h,
                height: 260.h,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.w,
                  crossAxisSpacing: 16.w,
                  children: mission.images
                      .map(
                        (img) => FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                          height: 122.w,
                          width: 122.w,
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              SizedBox(
                width: 260.h,
                height: 100.h,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.w,
                  crossAxisSpacing: 16.w,
                  children: mission.choices
                      .map(
                        (choice) => AnswerChip(text: choice.name),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: GlobalButton.missionSubmit(
                      onTap: () {},
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
