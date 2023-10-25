import 'package:get/get.dart';

class LoginController extends GetxController{
  // ///*  카카오 로그인
  // Future<void> signInWithKakao() async {
  //   bool install = await isKakaoTalkInstalled();
  //
  //   if (install) {
  //     try {
  //       await UserApi.instance.loginWithKakaoTalk();
  //
  //       User user = await UserApi.instance.me();
  //
  //       return {
  //         'email': user.kakaoAccount?.email,
  //         'provider': 'kakao',
  //         'providerId': user.id.toString()
  //       };
  //     } catch (error) {
  //       if (error is PlatformException && error.code == 'CANCELED') {
  //         return null;
  //       }
  //
  //       // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
  //       try {
  //         var code = await UserApi.instance.loginWithKakaoAccount();
  //         User user = await UserApi.instance.me();
  //         return {
  //           'email': user.kakaoAccount?.email,
  //           'provider': 'kakao',
  //           'providerId': user.id.toString()
  //         };
  //       } catch (error2) {
  //         // Logger().d('카카오계정으로 로그인 실패 $error2');
  //         return null;
  //       }
  //     }
  //   } else {
  //     try {
  //       var e = await UserApi.instance.loginWithKakaoAccount();
  //       User user = await UserApi.instance.me();
  //
  //       return {
  //         'email': user.kakaoAccount?.email,
  //         'provider': 'kakao',
  //         'providerId': user.id.toString()
  //       };
  //     } catch (error) {
  //       // Logger().d('카카오계정으로 로그인 실패 $error');
  //       return null;
  //     }
  //   }
  // }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}