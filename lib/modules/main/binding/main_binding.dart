import 'package:get/get.dart';
import 'package:ibaji/modules/camera/controller/camera_controller.dart';
import 'package:ibaji/modules/home/controller/home_controller.dart';
import 'package:ibaji/modules/mission/controller/mission_controller.dart';
import 'package:ibaji/modules/mypage/controller/my_page_controller.dart';
import 'package:ibaji/provider/service/map_service.dart';
import '../controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(MapService());
    Get.lazyPut(() => CameraScreenController());
    Get.lazyPut(() => MissionController());
    Get.lazyPut(() => MyPageController());
  }
}
