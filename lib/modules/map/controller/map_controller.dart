import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/light_api.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../provider/api/cloth_api.dart';
import '../../../provider/service/map_service.dart';

class MapController extends GetxController {
  List<String> placeType = ['전체', '의류수거함', '폐건전지/형광등'];

  Rx<LatLng> initialPosition = LatLng(37.7749, -122.4194).obs;

  ///0 -> 전체
  RxInt isSelected = 0.obs;

  Future<void> getCurrentLocation() async {
    PermissionStatus permissionStatus =
        await Permission.locationWhenInUse.request();
    if (permissionStatus.isGranted) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        MapService.to.googleMapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 20.0,
            ),
          ),
        );
      }).catchError((e) {
        Fluttertoast.showToast(msg: e);
      });
    } else {
      Fluttertoast.showToast(msg: '위치 권한을 허용해주세요');
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
