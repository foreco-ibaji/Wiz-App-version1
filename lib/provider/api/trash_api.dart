import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ibaji/model/category/category.dart';
import 'package:ibaji/model/category_method/category_method.dart';
import 'package:ibaji/model/detail_method/detail_method.dart';
import 'package:ibaji/model/motivation/motivation.dart';
import 'package:ibaji/provider/api/util/secret_key.dart';
import 'package:logger/logger.dart';

class TrashRepository {
  ///배출요일 조회
  ///* home_view
  static Future<List<Category>> getCalendar(
    String day,
  ) async {
    try {
      // 다른 필요한 데이터가 있다면 추가
      Response response = await Dio()
          .get(dotenv.env['apiUrl']! + "/disposal", queryParameters: {
        'region': Secrets.region,
        'day': day,
      });
      Logger().d(response.data);

      return List.generate(
        response.data['data'].length,
        (index) {
          return Category.fromJson(
            response.data['data'][index],
          );
        },
      );
    } catch (e) {
      Logger().d(e.toString());
      throw e.toString();
    }
  }

  ///세부 품목 조회
  ///* recycle_detail_view
  static Future<DetailMethod> getDetailMethod({
    int tab = 0,
    required String name,
  }) async {
    try {
      // 다른 필요한 데이터가 있다면 추가
      Response response = await Dio().get(dotenv.env['apiUrl']! + "/trash",
          queryParameters: {
            'region': Secrets.region,
            'name': name,
            'tab': tab
          });

      Logger().d(response.data['data']);

      return DetailMethod.fromJson(response.data['data']);
    } catch (e) {
      Logger().d(e.toString());
      throw e.toString();
    }
  }

  ///카테고리 품목 조회
  ///* recycle_detail_view
  static Future<CategoryMethod> getCategoryMethod(
    String category,
  ) async {
    try {
      // 다른 필요한 데이터가 있다면 추가
      Response response = await Dio().get(dotenv.env['apiUrl']! + "/category",
          queryParameters: {'region': Secrets.region, 'category': category});

      Logger().d(response.statusMessage);

      return CategoryMethod.fromJson(response.data['data']);
    } catch (e) {
      Logger().d(e.toString());
      throw e.toString();
    }
  }

  ///동기부여 페이지 조회
  ///* recycle_detail_view
  static Future<Motivation> getMotivation(
    int id,
  ) async {
    try {
      // 다른 필요한 데이터가 있다면 추가
      Response response = await Dio().get(dotenv.env['apiUrl']! + "/motive",
          queryParameters: {'trashId': id});

      Logger().d(response.statusMessage);

      return Motivation.fromJson(response.data['data']);
    } catch (e) {
      Logger().d(e.toString());
      throw e.toString();
    }
  }
}
