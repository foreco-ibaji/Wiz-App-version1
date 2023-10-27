import 'package:get/get.dart';

import '../controller/mission_controller.dart';

class MissionBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MissionController());
  }

}