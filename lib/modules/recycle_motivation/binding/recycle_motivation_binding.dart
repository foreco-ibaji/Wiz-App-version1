import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/recycle_motivation_controller.dart';

class MotivationTab extends GetxController
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

class RecycleMotivationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RecycleMotivationController());
  }
}
