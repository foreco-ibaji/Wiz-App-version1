import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../modules/camera/view/camera_result_view.dart';
import 'util/secret_key.dart';

class PhotoRepository {
  static Future<dynamic> getPhotoReuslt(String photoUrl) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(dotenv.env['apiUrl']! + "/image"));

      // 이미지 파일 추가
      request.files.add(await http.MultipartFile.fromPath('img', photoUrl));
      var response = await request.send();
      // 다른 필요한 데이터가 있다면 추가

      // var response = await request.send();
      // Response response =
      // await Dio().post(Secrets.dotenv.env['apiUrl'] + "/image", data: {"img": photoUrl});
      Logger().d(response.statusCode);
      var responseBody = await response.stream.bytesToString();
      var json = jsonDecode(responseBody);
      Logger().d(json);
      var result = jsonDecode(json['data']['result']);
      Logger().d(result['result']);
      Logger().d(result['result'].first[0]);
      try {
        if (result['id'] != null) {
          return result['id'];
        }
      } catch (e) {
        Logger().d(e.toString());
      }

      return result['result'];
    } catch (e) {
      Logger().d(e.toString());
      throw e.toString();
    }
  }
}
