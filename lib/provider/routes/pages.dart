import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/detail_method/binding/detail_method_binding.dart';
import '../../modules/detail_method/view/detail_method_view.dart';
import '../../modules/splash/binding/splash_binding.dart';
import '../../modules/splash/view/splash_view.dart';
import '../../modules/camera/binding/camera_binding.dart';
import '../../modules/camera/view/camera_view.dart';
import '../../modules/home/binding/home_binding.dart';
import '../../provider/routes/routes.dart';
import '../../modules/home/view/home_view.dart';
import '../../modules/map/binding/map_binding.dart';
import '../../modules/map/view/map_view.dart';

class Pages {
  static final routes = [
    GetPage(
      title: "스플래시 화면",
      name: Routes.splash,
      page: () => const SplashScreen(),
      transition: Transition.noTransition,
      binding: SplashBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "홈 화면",
      name: Routes.home,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
      binding: HomeBinding(),
      curve: Curves.easeIn,
      popGesture: false,
      children: [
        GetPage(
          title: "세부 품목 화면",
          name: Routes.detail,
          page: () => const DetailMethodScreen(),
          transition: Transition.native,
          binding: DetailMethodBinding(),
          curve: Curves.easeIn,
          popGesture: false,
          children: [],
        ),
      ],
    ),
    GetPage(
      title: "카메라 화면",
      name: Routes.camera,
      page: () => const CameraScreen(),
      transition: Transition.noTransition,
      binding: CameraBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "지도 화면",
      name: Routes.map,
      page: () => const MapScreen(),
      transition: Transition.noTransition,
      binding: MapBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
  ];
}
