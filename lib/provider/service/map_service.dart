import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/light_api.dart';
import 'package:permission_handler/permission_handler.dart';

import '../api/cloth_api.dart';
import '../api/util/secret_key.dart';

class MapService extends GetxService {
  static MapService get to => Get.find();
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;
  GoogleMapController? googleMapController;
  RxSet<Marker> markers = <Marker>{}.obs;
  Future<LatLng> getCurrentLocation() async {
    LatLng currentPosition = Secrets.initalPosition;
    PermissionStatus permissionStatus =
        await Permission.locationWhenInUse.request();
    if (permissionStatus.isGranted) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position pos) async {
        currentPosition = LatLng(pos.latitude, pos.longitude);
      });
    }
    return currentPosition;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await ClothApi.getClothPlace();
    await LightApi.getLightApi();
  }
}
