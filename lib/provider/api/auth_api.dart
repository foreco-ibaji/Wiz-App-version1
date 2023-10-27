import 'package:dio/dio.dart';
import 'package:ibaji/provider/api/util/dio_services.dart';
import 'package:ibaji/provider/api/util/global_api_field.dart';

import '../../model/member/member.dart';
import '../../util/style/global_logger.dart';

class AuthApi {
  ///<h2>login kakao API </h2>
  static Future<Member?> getMemberSignIn({
    required String token,
    required String region,
  }) async {
    try {
      logger.d("api호출 성공");
      Response response = await DioServices().to().get(
          "/api/v1/account/kakao/result",
          queryParameters: {"token": token, "region": region});
      return Member.fromJson(response.data[DATA]);
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }
}
