import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Secrets {
  static const String openBaseUrl = 'https://api.odcloud.kr/api/';
  static const String region = "서울시 동대문구 전농1동";
  static const String bigTrashReport =
      'https://www.ddm.go.kr/www/contents.do?key=82';
  static const LatLng initalPosition =
      LatLng(37.57366672797186, 127.02412311681951);
  static const String NAVER_GEODCODING =
      "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc";
}
