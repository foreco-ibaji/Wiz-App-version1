import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:ibaji/provider/api/util/dio_services.dart';
import 'package:ibaji/provider/api/util/global_api_field.dart';

// import 'package:get/get.dart';
import 'package:logger/logger.dart';

// import 'package:http/http.dart' as http;
import '../../model/photo_result/photo_result.dart';
import '../../modules/camera/view/camera_result_view.dart';
import '../../util/style/global_logger.dart';
import 'util/secret_key.dart';

class PhotoRepository {
  static Future<List<ResultDetail>> getPhotoReuslt(String photoUrl) async {
    Response response;
    var formData =
        FormData.fromMap({'img': await MultipartFile.fromFile(photoUrl)});
    try {
      response = await DioServices().to().post("/image",
          data: formData, options: Options(contentType: 'multipart/form-data'));
      var result  = response.data[DATA]["result"];
      return List.generate(
        result.length,
        (index) {
          return ResultDetail.fromJson(
            result[index],
          );
        },
      );
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
