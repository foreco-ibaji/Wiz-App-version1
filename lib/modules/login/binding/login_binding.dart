import 'package:get/get.dart';
import 'package:ibaji/modules/main/binding/main_binding.dart';

import '../../../provider/service/map_service.dart';
import '../controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(MapService());
}
}