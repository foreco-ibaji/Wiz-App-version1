import 'package:dio/dio.dart';
import 'package:ibaji/provider/api/util/dio_services.dart';
import 'package:ibaji/provider/api/util/global_api_field.dart';

import '../../model/member/member.dart';
import '../../util/style/global_logger.dart';
import '../service/map_service.dart';

class LoginApi {
  ///<h2>login kakao API </h2>
  static Future<Member?> getMemberSignIn({
    required String token,
  }) async {
    try {
      logger.d("api호출 성공");
      Response response = await DioServices().to().get(
          "/account/kakao/result",
          queryParameters: {"token": "Bearer ${token}",
            // "region": "서울특별시 ${MapService.currentAddress[1]} 면목동"
          });
      return Member.fromJson(response.data[DATA]);
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }
}
