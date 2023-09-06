import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../api/public_api.dart';
import '../api/util/map_api.dart';
import '../api/util/secret_key.dart';

class MapService extends GetxService {
  static MapService get to => Get.find();
  static Rx<LatLng> currentLatLng = Secrets.initalPosition.obs;
  static RxList<String> currentAddress = <String>[].obs;
  static NOverlayImage customIcon = NOverlayImage.fromAssetImage(
      'asset/image/object/map/ic_basci_picker_32.png');
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;
  // GoogleMapController? googleMapController;
  static NaverMapController? naverMapController;
  RxSet<NMarker> markers = <NMarker>{}.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    Logger().d(customIcon.runtimeType);
    await PublicApi.getClothApi();
    await PublicApi.getLightApi();
  }
}
