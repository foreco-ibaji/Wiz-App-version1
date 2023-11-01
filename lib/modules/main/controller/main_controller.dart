import 'package:get/get.dart';

import '../../../provider/api/util/map_api.dart';
import '../../../provider/service/map_service.dart';
import '../../../util/routes/routes.dart';

class MainController extends GetxController {
  RxInt selectIdx = 0.obs;

  @override
  void onInit() async {
    // //api 속도때문에 map service로 이동
    MapService.currentLatLng.value = await MapRepository.getCurrentLocation();
    MapService.currentAddress.assignAll(
        await MapRepository.getAddressFromLatLng(
            MapService.currentLatLng.value));
  }
}
