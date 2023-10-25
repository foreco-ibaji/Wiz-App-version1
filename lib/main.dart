import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:logger/logger.dart';

import 'modules/splash/binding/splash_binding.dart';
import 'util/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await NaverMapSdk.instance.initialize(
      clientId: dotenv.env['NAVER_CLIENT_ID'].toString(),
      onAuthFailed: (error) {
        Logger().d('Auth failed: $error');
      });
  KakaoSdk.init(
    nativeAppKey: dotenv.env['KAKAO_API_KEY'].toString(),
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: ((context, child) {
        return GetMaterialApp(
          getPages: Pages.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: 'Pretendard',
          ),
          supportedLocales: const [
            Locale('ko', 'KR'),
          ],
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          initialRoute: "/splash",
          initialBinding: SplashBinding(),
          smartManagement: SmartManagement.full,
          navigatorKey: Get.key,
        );
      }),
    );
  }
}
