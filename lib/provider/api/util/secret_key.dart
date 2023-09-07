import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Secrets {
  static const String openBaseUrl = 'https://api.odcloud.kr/api';
  static const String region = "서울시 동대문구 전농1동";
  static const String bigTrashReport =
      'https://www.ddm.go.kr/www/contents.do?key=82';
  static const LatLng initalPosition =
      LatLng(37.580548411753234, 127.04579398689609);
  static const String NAVER = 'https://naveropenapi.apigw.ntruss.com/';
  static const String NAVER_CAR = NAVER + "map-direction/v1/driving";
  static const String NAVER_GEODCODING = NAVER + "map-reversegeocode/v2/gc";
}
