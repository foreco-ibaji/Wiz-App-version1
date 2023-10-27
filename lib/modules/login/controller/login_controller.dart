import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginController extends GetxController {
  ///*  카카오 로그인
  Future<void> signInWithKakao() async {
    // 카카오 설치여부 확인
    bool install = await isKakaoTalkInstalled();
    if (install) {
      try {
        // 카카오 로그인 내부 메소드 호출
        await UserApi.instance.loginWithKakaoTalk();
        User user = await UserApi.instance.me();
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          return null;
        }

        try {
          var code = await UserApi.instance.loginWithKakaoAccount();
          User user = await UserApi.instance.me();

        } catch (error2) {
          // Logger().d('카카오계정으로 로그인 실패 $error2');
          return null;
        }
      }
    } else {
      try {
        var e = await UserApi.instance.loginWithKakaoAccount();
        User user = await UserApi.instance.me();
      } catch (error) {
        // Logger().d('카카오계정으로 로그인 실패 $error');
        return null;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
