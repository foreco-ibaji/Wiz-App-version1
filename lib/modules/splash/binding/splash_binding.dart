import 'package:get/get.dart';
import 'package:ibaji/provider/service/map_service.dart';
import '../controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(PolyService());
  }
}
