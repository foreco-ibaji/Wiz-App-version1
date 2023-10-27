import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MissionTabBar extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}


class MissionController extends GetxController{
  Rx<MissionTabBar> missionTabBar  = MissionTabBar().obs;
  RxInt tabIndex = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    missionTabBar.value = Get.put(MissionTabBar());
  }
}