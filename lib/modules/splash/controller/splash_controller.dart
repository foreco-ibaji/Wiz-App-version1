import 'package:get/get.dart';
import 'package:ibaji/provider/api/public_api.dart';

import '../../../provider/api/util/map_api.dart';
import '../../../provider/routes/routes.dart';
import '../../../provider/service/map_service.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: get user location
    super.onInit();
    //api 속도때문에 map service로 이동
    MapService.currentLatLng.value = await MapRepository.getCurrentLocation();
    MapService.currentAddress.assignAll(
        await MapRepository.getAddressFromLatLng(
            MapService.currentLatLng.value));
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.home); // 홈 화면으로 이동
    });
  }
}
