import 'package:get/get.dart';
import 'package:ibaji/provider/service/camera_service.dart';

import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
