import 'package:get/get.dart';

import '../controller/detail_method_controller.dart';

class DetailMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailMethodController(id: 1));
  }
}
