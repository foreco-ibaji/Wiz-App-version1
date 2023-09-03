import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/util/secret_key.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class MapRepository {
  static Future<void> getAddressFromLatLng(
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
        'coords': "${currentPos.latitude},${currentPos.longitude}",
        'output': "json",
        "orders": "addr,admcode,roadaddr"
      });
      Logger().d(response.data);
      var tmpResponse = response.data;
      // if (tmpResponse.isNotEmpty) {
      //   final address = tmpResponse[0]['formatted_address'] as String;
      //   return address;
      // } else {
      //   return null; // 주소를 찾을 수 없음
      // }
    } catch (e) {
      Logger().d(e.toString());
      throw e.toString();
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
