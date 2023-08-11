import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ibaji/model/category_method/category_method.dart';
import 'package:ibaji/model/detail_method/detail_method.dart';
import 'package:ibaji/model/disposal/disposalInfo.dart';
import 'package:ibaji/provider/api/trash_api.dart';
import 'package:logger/logger.dart';

import '../../../model/category/category.dart';
import '../../../model/detail/detail.dart';
import '../../../model/trash/trash.dart';

class DetailMethodController extends GetxController {
  static DetailMethodController get to => Get.find();
  String trash = Get.arguments['trash'];
  RxList<String> titleList = <String>[].obs;
  RxList<bool> isExpansion = <bool>[false, false].obs;
  RxInt currentIdx = 0.obs;
  Rx<DetailMethod> detailMethod = DetailMethod(
      orderOfTab: 1,
      maxNumOfTab: 1,
      trashIcon: "trashIcon",
      titleOfTab: "titleOfTab",
      id: 1,
      isRecyclable: "isRecyclable",
      trashName: "trashName",
      disposalMethod: ["disposalMethod"],
      disposalInfo: DisposalInfo(days: ["days"], time: "time"),
      remark: [],
      examples: <Detail>[],
      recommendTrashes: <Trash>[]).obs;

  @override
  void onInit() async {
    detailMethod.value = await TrashRepository.getDetailMethod(name: trash);
    if (detailMethod.value.maxNumOfTab != 0 &&
        detailMethod.value.maxNumOfTab != null) {
      Logger().d('fsdfd');
      titleList.add(detailMethod.value.titleOfTab ?? "");
      for (int i = 1; i <= detailMethod.value.maxNumOfTab!; i++) {
        var tmpList =
            await TrashRepository.getDetailMethod(name: trash, tab: i);
        titleList.add(tmpList.titleOfTab ?? "");
      }
    }

    super.onInit();
  }
}
