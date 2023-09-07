import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:get/get.dart';
import 'package:logger/logger.dart';
// import 'package:http/http.dart' as http;
import '../../modules/camera/view/camera_result_view.dart';
import 'util/secret_key.dart';

class PhotoRepository {
  static Future<dynamic> getPhotoReuslt(String photoUrl) async {
    Response response;
    var formData =
        FormData.fromMap({'img': await MultipartFile.fromFile(photoUrl)});
    try {
      Dio dio = Dio();
      dio.options.contentType = 'multipart/form-data';
      dio.options.followRedirects = true;
      dio.options.maxRedirects = 5;
      response =
          await dio.post(dotenv.env['apiUrl']! + "/image", data: formData);

      try {
        if (response.data['id'] != null) {
          return response.data['id'];
        }
      } catch (e) {
        Logger().d(e.toString());
      }

      return response.data['result'];
    } catch (e) {
      Logger().d(e.toString());
      return null;
    }
  }
}
