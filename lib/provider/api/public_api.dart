import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  ///23년도 6월 get 요청주소
  static String clothParam =
      '/15112228/v1/uddi:67d42349-302e-40f6-af11-c496e532d090?page=1&perPage=10&serviceKey=6ukHRfTd3TeZw03mnb3%2BI%2Bsoh%2FyRKlMGlnmDmdvh%2BdkRCDP%2B6xuNi%2Bo1%2BJv2XVe39xd34MFqClKgMhtpVlXrzA%3D%3D';

  ///23년도 6월 get 요청주소
  static String lightParam =
      '/15038091/v1/uddi:2636cb3c-30e3-4ce3-aca9-ca040f5deb27?page=1&perPage=10&serviceKey=6ukHRfTd3TeZw03mnb3%2BI%2Bsoh%2FyRKlMGlnmDmdvh%2BdkRCDP%2B6xuNi%2Bo1%2BJv2XVe39xd34MFqClKgMhtpVlXrzA%3D%3D';
  static Future<void> getClothApi() async {
    try {
      var response = await Dio().get(
        Secrets.openBaseUrl + clothParam,
        // queryParameters: {
        //   'page': 1,
        //   'perPage': 10,
        //   'serviceKey': dotenv.env['OPEN_API_KEY_DEC']
        // }
      );
      // Logger().d(response.realUri);
      // Logger().d('2 data get');

      var data = response.data['data'];
      // Logger().d(data);
      var customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 1.0),
        'asset/image/object/map/ic_basci_picker_32.png',
      );
      var id = 0;
      for (var i in data) {
        // var location = await MapRepository.getLocationFromAddress(i['주소']);
        Logger()
            .d('의류 ${i}번째는 ${double.parse(i['위도'])} ${double.parse(i['경도'])}');
        NMarker marker = NMarker(
            id: 'cloth' + id.toString(),
            position: NLatLng(
                double.parse(i['위도']) ?? 30, double.parse(i['경도']) ?? 127),
            icon: MapService.customIcon,
            iconTintColor: Colors.black,
            size: Size(30.w, 30.w));
        marker.setOnTapListener((overlay) async {
          var walkDur = await MapRepository.getWalkTime(
              LatLng(double.parse(i['위도']), double.parse(i['경도'])));
          Get.bottomSheet(MapBottomContainer(
            type: "의류",
            iconUrl: 'cloth',
            address: i['주소'],
            distance: walkDur['distance'] ?? 0,
            duration: walkDur['duration'] ?? 0,
          ));
        });

        MapService.to.markers.add(marker);
        if (!MapService.to.markers.add(marker)) {
          Logger().d('왜..?');
        }
        id++;
      }
      Logger().d("marker 추가 완료");
    } catch (e) {
      Logger().d(e);
    }
  }

  static Future<void> getLightApi() async {
    try {
      var dio = Dio();
      dio.options.headers = {
        'Authorization': dotenv.env['OPEN_API_KEY'],
      };
      var response = await Dio().get(
        Secrets.openBaseUrl + lightParam,
        // queryParameters: {
        //   'page': 1,
        //   'perPage': 100,
        //   'serviceKey': dotenv.env['OPEN_API_KEY_DEC']
        // }
      );
      Logger().d('2 data get');

      var data = response.data['data'];
      var customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 1.0),
        'asset/image/object/map/ic_basci_picker_32.png',
      );
      var id = 0;
      for (var i in data) {
        Logger().d(i);
        var location = await MapRepository.getLocationFromAddress(i['설치주소']);
        Logger()
            .d('의류 ${i}번째는 ${double.parse(i['위도'])} ${double.parse(i['경도'])}');

        NMarker marker = NMarker(
            id: 'light$id',
            position:
                NLatLng(location?.latitude ?? 30, location?.longitude ?? 127),
            icon: MapService.customIcon,
            size: Size(30.w, 30.w));
        marker.setOnTapListener((overlay) async {
          var walkDur = await MapRepository.getWalkTime(LatLng(
              location?.latitude ?? 37.568350744909324,
              location?.longitude ?? 127.00873566042249));
          Get.bottomSheet(MapBottomContainer(
            type: "폐건전지/형광등",
            iconUrl: 'bolt',
            address: i['설치주소'],
            distance: walkDur['distance'] ?? 0,
            duration: walkDur['duration'] ?? 0,
          ));
        });

        if (!MapService.to.markers.add(marker)) {
          Logger().d('왜..?');
        }
        id++;
      }
      Logger().d("marker 추가 완료");
    } catch (e) {
      throw e.toString();
    }
  }
}
