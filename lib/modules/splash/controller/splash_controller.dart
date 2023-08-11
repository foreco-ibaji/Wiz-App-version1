import 'package:get/get.dart';
import 'package:ibaji/provider/api/cloth_api.dart';

import '../../../provider/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: get user location
    super.onInit();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.home); // 홈 화면으로 이동
    });
  }
}
