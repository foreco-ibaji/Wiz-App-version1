import 'package:get/get.dart';
import 'package:ibaji/modules/mypage/controller/my_page_controller.dart';

class MyPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyPageController());
  }
}
