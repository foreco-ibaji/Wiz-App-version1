import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/search/widget/search_widget.dart';

import '../../../util/app_colors.dart';
import '../../../util/app_text_styles.dart';
import '../controller/search_controller.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "탐색",
          style: AppTextStyles.title1SemiBold.copyWith(color: AppColors.grey9),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(
          () => ListView(
            children: [
              SizedBox(
                height: 24.h,
              ),
              CupertinoTextField(
                padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                controller: controller.searchTextController.value,
                decoration: BoxDecoration(
                  color: AppColors.grey1,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                style:
                    AppTextStyles.title3Medium.copyWith(color: AppColors.grey7),
                placeholder: "찾으시는 쓰레기가 있으신가요?",
                placeholderStyle:
                    AppTextStyles.title3Medium.copyWith(color: AppColors.grey7),
                suffix: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child:
                        SvgPicture.asset("asset/image/icon/ic_search_24.svg")),
                onSubmitted: ((value) {
                  controller.search(value);
                  controller.isSearch.value = true;
                }),
              ),
              SizedBox(
                height: 40.h,
              ),
              controller.isSearch.value ? SearchResult() : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
