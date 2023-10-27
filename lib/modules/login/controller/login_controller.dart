import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibaji/provider/api/login_api.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../util/style/global_logger.dart';

class LoginController extends GetxController {
  ///*  카카오 로그인
  Future<void> signInWithKakao() async {
    // 카카오 설치여부 확인
    bool install = await isKakaoTalkInstalled();
    try {
      // 카카오 로그인 내부 메소드 호출
      OAuthToken token = install
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
      var tmpResult = await LoginApi.getMemberSignIn(token: token.accessToken);
      logger.d(tmpResult);
    } catch (error) {
      logger.e(error.toString());
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
