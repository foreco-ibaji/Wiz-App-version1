import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/light_api.dart';

import '../api/cloth_api.dart';

class PolyService extends GetxService {
  static PolyService get to => Get.find();
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;
  GoogleMapController? googleMapController;
  RxSet<Marker> markers = <Marker>{}.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await ClothApi.getClothPlace();
    await LightApi.getLightApi();
  }
}
