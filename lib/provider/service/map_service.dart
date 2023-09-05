import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/light_api.dart';
import 'package:permission_handler/permission_handler.dart';

import '../api/cloth_api.dart';
import '../api/util/map_api.dart';
import '../api/util/secret_key.dart';

class MapService extends GetxService {
  static MapService get to => Get.find();
  static Rx<LatLng> currentLatLng = Secrets.initalPosition.obs;
  static RxList<String> currentAddress = <String>[].obs;
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
