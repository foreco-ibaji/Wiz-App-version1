import 'package:flutter/material.dart';
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
  static late BitmapDescriptor customIcon;
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;
  GoogleMapController? googleMapController;
  RxSet<Marker> markers = <Marker>{}.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(32.h, 32.h)),
      'asset/image/object/map/ic_basci_picker_32.png',
    );
    Logger().d(customIcon.runtimeType);
    await PublicApi.getClothApi();
    await PublicApi.getLightApi();
  }
}
