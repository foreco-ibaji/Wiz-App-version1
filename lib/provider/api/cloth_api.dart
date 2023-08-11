import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/util/geolcator.dart';
import 'package:ibaji/provider/api/util/image_util.dart';
import 'package:ibaji/provider/api/util/secret_key.dart';
import 'package:logger/logger.dart';

import '../../modules/map/widget/map_widget.dart';
import '../service/map_service.dart';

class ClothApi {
  //총 502개

  ///22년도 get 요청주소
  static String parameter =
      '15112228/v1/uddi:fe015b14-42d2-4adb-a4f3-a1d22cbcc0f7';
  static String url =
      "${Secrets.protocol}://${Secrets.baseUrl}/$parameter?page=1&perPage=100&serviceKey=${dotenv.env['OPEN_API_KEY']}";
  static Future<void> getClothPlace() async {
    try {
      var response = await Dio().get(
        url,
      );
      Logger().d('2 data get');

      var data = response.data['data'];
      BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 1.0),
        'asset/image/marker/ic_cloth_40.png',
      );
      // BitmapDescriptor customIcon = BitmapDescriptor.fromBytes(resizedImage);

      var id = 0;
      // data.forEach(await getLocationFromAddress(data['주 소']));
      data.forEach((i) async {
        var location = await getLocationFromAddress(i['주 소']);
        Marker marker = Marker(
            markerId: MarkerId('cloth' + id.toString()),
            position:
                LatLng(location?.latitude ?? 30, location?.longitude ?? 127),
            icon: customIcon,
            onTap: () {
              Get.bottomSheet(MapBottomContainer(address: i['주 소']));
            });

        PolyService.to.markers.add(marker);
        id++;
      });
      Logger().d("marker 추가 완료");
    } catch (e) {
      Logger().d(e);
    }
  }
}
