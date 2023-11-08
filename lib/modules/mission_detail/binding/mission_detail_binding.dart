import 'package:get/get.dart';

import '../controller/mission_detail_controller.dart';

class MissionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MissionDetailController());
  }
}
