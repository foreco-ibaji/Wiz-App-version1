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
import '../../../provider/api/util/geolcator.dart';
import '../../../provider/service/map_service.dart';

class MapController extends GetxController {
  Map<String, String> placeType = {
    '폐건전지': 'bolt',
    '폐형광등': 'light',
    '의류수거': 'cloth',
  };

  Rx<LatLng> initialPosition = LatLng(37.7749, -122.4194).obs;

  ///0 -> 전체
  RxInt isSelected = 0.obs;
  // Future<void> getCurrentLocation() async {
  //   PermissionStatus permissionStatus =
  //       await Permission.locationWhenInUse.request();
  //   if (permissionStatus.isGranted) {
  //     await Geolocator.getCurrentPosition(
  //             desiredAccuracy: LocationAccuracy.high)
  //         .then((Position position) async {})
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e);
  //     });
  //   } else {
  //     Fluttertoast.showToast(msg: '위치 권한을 허용해주세요');
  //   }
  // }
  Future<void> getCurrentLocation() async {
    PermissionStatus permissionStatus =
        await Permission.locationWhenInUse.request();
    if (permissionStatus.isGranted) {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        PolyService.to.googleMapController?.animateCamera(
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
