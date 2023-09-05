import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/util/map_api.dart';
import 'package:ibaji/provider/api/util/image_util.dart';
import 'package:ibaji/provider/api/util/secret_key.dart';
import 'package:logger/logger.dart';

import '../../modules/map/widget/map_widget.dart';
import '../service/map_service.dart';

class LightApi {
  //총 97개
  ///22년도 get 요청주소
  static String parameter =
      '15038091/v1/uddi:8444de06-d3d7-495d-80ed-f1254bbdc9de';
  static String url =
      "${Secrets.protocol}://${Secrets.baseUrl}/$parameter?page=1&perPage=97&serviceKey=${dotenv.env['OPEN_API_KEY']}";

  static Future<void> getLightApi() async {
    try {
      var response = await Dio().get(
        url,
      );
      Logger().d('2 data get');

      var data = response.data['data'];

      BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 0.001),
        'asset/image/marker/ic_light_40.png',
      );
      BitmapDescriptor customIcon2 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 0.001),
        'asset/image/marker/ic_bolt_40.png',
      );

      var id = 0;
      // data.forEach(await getLocationFromAddress(data['주 소']));
      data.forEach((i) async {
        var location = await MapRepository.getLocationFromAddress(i['설치주소']);
        Marker marker;
        if (id.isOdd) {
          marker = Marker(
            markerId: MarkerId('light' + id.toString()),
            position:
                LatLng(location?.latitude ?? 30, location?.longitude ?? 127),
            icon: customIcon,
            onTap: (() {
              // Get.bottomSheet(MapBottomContainer(
              //   address: i['설치주소'],
              // ));
            }),
          );
        } else {
          marker = Marker(
            markerId: MarkerId('bolt' + id.toString()),
            position:
                LatLng(location?.latitude ?? 30, location?.longitude ?? 127),
            icon: customIcon2,
            onTap: (() {
              // Get.bottomSheet(MapBottomContainer(
              //   address: i['설치주소'],
              // ));
            }),
          );
        }

        // Logger().d(marker.position);

        MapService.to.markers.add(marker);
        id++;
      });
      Logger().d("marker 추가 완료");
    } catch (e) {
      Logger().d(e);
    }
  }
}
