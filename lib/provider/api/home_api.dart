import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ibaji/provider/api/util/secret_key.dart';
import 'package:logger/logger.dart';

class HomeRepository {
  ///배출요일 조회
  ///* home_view
  static Future<List<String>> getCalendar(
    String day,
  ) async {
    try {
      Response response = await Dio()
          .get(dotenv.env['apiUrl']! + "/category", queryParameters: {
        'day': day,
      });
      Logger().d(response.data);

      return List<String>.from(response.data['data']['categoryNames']);
    } catch (e) {
      Logger().d(e.toString());
      throw e.toString();
    }
  }
}
