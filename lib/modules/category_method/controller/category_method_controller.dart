import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ibaji/model/category_method/category_method.dart';
import 'package:ibaji/model/disposal/disposalInfo.dart';
import 'package:ibaji/provider/api/trash_api.dart';
import 'package:logger/logger.dart';

import '../../../model/category/category.dart';

class CategoryMethodController extends GetxController {
  static CategoryMethodController get to => Get.find();
  Category category = Get.arguments['category'];
  Rx<CategoryMethod> categoryMethod = CategoryMethod(
      categoryName: "categoryName",
      categoryIcon: "categoryIcon",
      disposalMethod: [],
      remark: [],
      disposalInfo: DisposalInfo(days: [], time: "time"),
      recommendCategories: <Category>[]).obs;
  @override
  void onInit() async {
    super.onInit();
    Logger().d("카테고리 화면 등장;배출 캘린더에서 접근");
    // categoryMethod.value =
    //     await TrashRepository.getCategoryMethod(category.categoryName);
    Logger().d(categoryMethod.value);
  }
}
