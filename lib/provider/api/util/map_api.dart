import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/util/secret_key.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../service/map_service.dart';

class MapRepository {
  ///*Naver Reverse Geocoding API 사용
  ///위경도로부터 실 도로명주소 반환
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
      //TODO 결과값이 정확하지않아 정확도를 높이는 작업이 필요
      //TODO:초기 로딩시에 받아온값을 로컬에 저장해서 일정주기마다 초기화 시켜주는식으로 API 호출량 절약
      address.add(tmpResponse2['name'] + " " + tmpResponse2['number1']);
      return address;
    } catch (e) {
      Logger().d(e.toString());
      //임시 하드코딩; 애뮬레이터의 경우 미국주소를 받아오기때문에
      //네이버 api가 반환할수없음
      MapService.currentLatLng.value = Secrets.initalPosition;
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

  ///*도보계산
  ///*OSRM API 사용
  static Future<Map<String, int>> getWalkTime(
    LatLng endLocation,
  ) async {
    final origin = MapService.currentLatLng.value.longitude.toString() +
        ',' +
        MapService.currentLatLng.value.latitude.toString();
    final destination = endLocation.longitude.toString() +
        ',' +
        endLocation.latitude.toString();
    final apiUrl =
        "https://router.project-osrm.org/route/v1/walking/$origin;$destination";
    print(apiUrl);
    try {
      Response response = await Dio().get(apiUrl);
      // 경로 정보 가져오기
      final routes = response.data['routes'];
      Logger().d(response.data);
      var duration = 0;
      var distance = 0;
      if (routes.isNotEmpty) {
        final route = routes[0];
        duration = route['duration'].toInt();
        distance = route['distance'].toInt();
      }
      return {"duration": duration, "distance": distance};
    } catch (e) {
      Logger().d(e.toString());
      return {"duration": 0, "distance": 0};
    }
  }

  // ///*Naver direction5  API 사용
  // ///차량 거리 계산
  // static Future<int> getDriveTime(LatLng endLocation) async {
  //   try {
  //     final dio = Dio();
  //     dio.options.headers = {
  //       'X-NCP-APIGW-API-KEY-ID': dotenv.env['NAVER_CLIENT_ID'],
  //       'X-NCP-APIGW-API-KEY': dotenv.env['NAVER_SECRET_KEY'],
  //     };
  //     Response response = await dio.get(Secrets.NAVER_CAR, queryParameters: {
  //       'start':
  //           "${MapService.currentLatLng.value.longitude.toString()},${MapService.currentLatLng.value.latitude.toString()}",
  //       'goal':
  //           "${endLocation.longitude.toString()},${endLocation.latitude.toString()}",
  //     });
  //     var duration =
  //         response.data['route']['traoptimal'][0]['summary']['distance'];
  //     return duration.toInt();
  //   } catch (e) {
  //     Logger().d(e.toString());
  //     return 0;
  //   }
  // }
}
