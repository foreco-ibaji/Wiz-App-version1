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
  late Rx<DetailMethod> detailMethod;
  late RxList<Trash> relationTrash;
  @override
  void onInit() async {
    detailMethod.value = await TrashRepository.getDetailMethod(name: trash);
    super.onInit();
  }
}
