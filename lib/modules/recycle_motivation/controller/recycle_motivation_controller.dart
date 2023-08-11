import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibaji/provider/api/trash_api.dart';
import 'package:logger/logger.dart';

import '../../../model/motivation/motivation.dart';
import '../binding/recycle_motivation_binding.dart';

class RecycleMotivationController extends GetxController {
  var id = Get.arguments['id'];
  static RecycleMotivationController get to => Get.find();
  Rx<Motivation> motivation =
      Motivation(recyclingProcess: [], time: [], ifYouDoNot: []).obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  GlobalKey index01 = GlobalKey();
  GlobalKey index02 = GlobalKey();
  GlobalKey index03 = GlobalKey();

  Rx<double> scrollPosition = 0.0.obs;
  double _scrollPosition = 0.0;
  RxString tmpObject = '종이'.obs;
  MotivationTab? motivationTab;
  List<String> tabsList = ['재활용 과정', '만들수 있는 물품', '분리수거 안하면'];
  RxInt currentIdx = 0.obs;
  List<String> tmpImgList = [
    'asset/image/object/iv_blanket_40.png',
    'asset/image/object/iv_blanket_40.png'
  ];
  RxBool isTabBarFloating = true.obs;
  @override
  void onReady() {
    // TODO: implement onReady

    scrollController.value.addListener(() {
      scrollPosition.value = scrollController.value.position.pixels;
      if (scrollController.value.offset >=
          MediaQuery.of(Get.context!).padding.top) {
        // 스크롤 위치가 상단에 위치하면 TabBar를 고정합니다.

        isTabBarFloating.value = true;
      } else {
        // 스크롤 위치가 상단에 위치하지 않으면 TabBar를 고정하지 않습니다.
        isTabBarFloating.value = false;
      }
    });
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    motivationTab = Get.put(MotivationTab());
    motivation.value = await TrashRepository.getMotivation(id);
    Logger().d(motivation.value);
  }
}
