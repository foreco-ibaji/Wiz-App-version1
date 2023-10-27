import 'package:get/get.dart';

abstract class Routes {
  Routes._();

  /// 스플래시 화면(onboarding)
  static const splash = _Paths.splash;

  /// 스플래시 화면(onboarding)
  static const login = _Paths.login;

  /// 메인 화면
  static const main = _Paths.main;

  /// 홈 화면
  static const home = _Paths.home;

  /// 재활용방법
  static const detail = _Paths.detail;

  /// 동기부여화면
  static const recycle_motivation = _Paths.recycle_motivation;

  /// 카메라
  static const camera = _Paths.camera;

  /// 지도
  static const map = _Paths.map;

  /// 미션 화면
  static const mission = _Paths.mission;
}

abstract class _Paths {
  _Paths._();

  /// 스플래시 화면(onboarding)
  static const splash = "/splash";

  /// 로그인 화면
  static const login = "/login";

  /// 홈 화면
  static const main = "/main";

  /// 홈 화면
  static const home = "/home";

  /// 재활용방법
  static const detail = "/detail";

  /// 동기부여화면
  static const recycle_motivation = "/motivation";

  /// 카메라
  static const camera = "/camera";

  /// 지도
  static const map = "/map";

  /// 미션 화면
  static const mission = "/mission";
}
