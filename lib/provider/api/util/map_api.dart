import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/util/secret_key.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class MapRepository {
  static Future<List<String>> getAddressFromLatLng(
    LatLng currentPos,
  ) async {
    try {
      final dio = Dio();
      dio.options.headers = {
        'X-NCP-APIGW-API-KEY-ID': dotenv.env['NAVER_CLIENT_ID'],
        'X-NCP-APIGW-API-KEY': dotenv.env['NAVER_SECRET_KEY'],
      };
      Response response =
          await dio.get(Secrets.NAVER_GEODCODING, queryParameters: {
        // 'request': 'coordToaddr',
        'coords':
            "${currentPos.longitude.toString()},${currentPos.latitude.toString()}",
        'output': "json",
        'sources': 'epsg:3857',
        "orders": "admcode,roadaddr"
      });
      // JSON 문자열을 Map으로 파싱
      var tmpResponse = response.data['results'][0]['region'];
      List<String> address = [];
      for (int i = 1; i < 4; i++) {
        address.add(tmpResponse['area${i}']['name']);
      }
      var tmpResponse2 = response.data['results'][1]['land'];
      Logger().d(tmpResponse2);
      //TODO 결과값이 정확하지않아 정확도를 높이는 작업이 필요
      //TODO:초기 로딩시에 받아온값을 로컬에 저장해서 일정주기마다 초기화 시켜주는식으로 API 호출량 절약
      address.add(tmpResponse2['name'] + " " + tmpResponse2['number1']);
      return address;
    } catch (e) {
      Logger().d(e.toString());
      //임시 하드코딩; 애뮬레이터의 경우 미국주소를 받아오기때문에
      //네이버 api가 반환할수없음
      return ["서울특별시", "동대문구", "전농1동", "ddp"];
    }
  }

  static Future<Location?> getLocationFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      return locations.first;
    } catch (e) {
      Logger().d(e.toString() + address);
    }
  }

  static Future<LatLng> getCurrentLocation() async {
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
}
