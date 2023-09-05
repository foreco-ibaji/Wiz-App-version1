import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/util/map_api.dart';
import 'package:ibaji/provider/api/util/image_util.dart';
import 'package:ibaji/provider/api/util/secret_key.dart';
import 'package:logger/logger.dart';

import '../../modules/map/widget/map_widget.dart';
import '../service/map_service.dart';

class PublicApi {
  //총 502개

  ///22년도 get 요청주소
  static String clothParam =
      '15112228/v1/uddi:fe015b14-42d2-4adb-a4f3-a1d22cbcc0f7';

  ///22년도 get 요청주소
  static String lightParam =
      '15038091/v1/uddi:8444de06-d3d7-495d-80ed-f1254bbdc9de';
  static Future<void> getClothApi() async {
    try {
      var response = await Dio().get(Secrets.openBaseUrl + clothParam,
          queryParameters: {
            'page': 1,
            'perPage': 100,
            'serviceKey': dotenv.env['OPEN_API_KEY']
          });
      Logger().d(response.realUri);
      Logger().d('2 data get');

      var data = response.data['data'];
      var id = 0;
      data.forEach((i) async {
        var location = await MapRepository.getLocationFromAddress(i['주 소']);
        Marker marker = Marker(
            markerId: MarkerId('cloth' + id.toString()),
            position:
                LatLng(location?.latitude ?? 30, location?.longitude ?? 127),
            icon: MapService.customIcon,
            onTap: () {
              Get.bottomSheet(MapBottomContainer(
                type: "의류",
                iconUrl: 'cloth',
                address: i['주 소'],
                distance: 0,
                duration: 0,
              ));
            });

        MapService.to.markers.add(marker);
        id++;
      });
      Logger().d("marker 추가 완료");
    } catch (e) {
      Logger().d(e);
    }
  }

  static Future<void> getLightApi() async {
    try {
      var response = await Dio().get(Secrets.openBaseUrl + lightParam,
          queryParameters: {
            'page': 1,
            'perPage': 100,
            'serviceKey': dotenv.env['OPEN_API_KEY']
          });
      Logger().d('2 data get');

      var data = response.data['data'];
      var id = 0;
      data.forEach((i) async {
        var location = await MapRepository.getLocationFromAddress(i['주 소']);
        Marker marker = Marker(
            markerId: MarkerId('light' + id.toString()),
            position:
                LatLng(location?.latitude ?? 30, location?.longitude ?? 127),
            icon: MapService.customIcon,
            onTap: () {
              //TODO: distance, duration add
              Get.bottomSheet(MapBottomContainer(
                type: "폐건전지/형광등",
                iconUrl: 'bolt',
                address: i['주 소'],
                distance: 0,
                duration: 0,
              ));
            });

        MapService.to.markers.add(marker);
        id++;
      });
      Logger().d("marker 추가 완료");
    } catch (e) {
      Logger().d(e);
    }
  }
}
