import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/search/widget/search_widget.dart';

import '../../../util/app_colors.dart';
import '../../../util/app_text_styles.dart';
import '../controller/search_controller.dart';

class SearchScreen extends GetView<SearchViewController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchViewController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: AppColors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
          color: AppColors.grey9,
        ),
        title: Text(
          "검색",
          style: AppTextStyles.title1SemiBold.copyWith(color: AppColors.grey9),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(
          () => ListView(
            children: [
              // SizedBox(
              //   height: 30.h,
              // ),
              CupertinoTextField(
                padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                controller: controller.searchTextController.value,
                decoration: BoxDecoration(
                  color: AppColors.grey1,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                style:
                    AppTextStyles.title3Medium.copyWith(color: AppColors.grey3),
                placeholder: "찾으시는 쓰레기가 있으신가요?",
                placeholderStyle:
                    AppTextStyles.title3Medium.copyWith(color: AppColors.grey3),
                suffix: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: SvgPicture.asset(
                        "asset/image/icon/ic_search_outline.svg")),
                onSubmitted: ((value) async {
                  await controller.getSearchResult(value);
                  controller.isSearch.value = true;
                }),
              ),
              SizedBox(
                height: 40.h,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return SearchResult(trash: controller.searchResults[index]);
                  }),
                  separatorBuilder: ((context, index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  }),
                  itemCount: controller.searchResults.length)
            ],
          ),
        ),
      ),
    );
  }
}
