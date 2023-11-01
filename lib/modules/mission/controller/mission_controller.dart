import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibaji/model/dashboard/dashboard.dart';
import 'package:ibaji/model/enum/level_type.dart';
import 'package:ibaji/provider/api/login_api.dart';

import '../../../model/mission/mission.dart';
import '../../../provider/api/mission_api.dart';
import '../../../provider/api/util/global_mock_data.dart';

class MissionTabBar extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class MissionController extends GetxController {
  Rx<MissionTabBar> missionTabBar = MissionTabBar().obs;
  RxInt tabIndex = 0.obs;
  Rx<bool> isTotal = false.obs;
  RxList<Mission> wizMissions = <Mission>[].obs;
  RxList<Mission> socialMissions = <Mission>[].obs;
  Rx<LevelStatus>? currentLevel;
  Rx<Dashboard> mypage = tmpDashBoard.obs;

  Future<void> setLevelList({
    required String level
}) async {
    wizMissions.assignAll(await MissionApi.getMissionList(
        difficulty: level));
  }


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    missionTabBar.value = Get.put(MissionTabBar());
    wizMissions.assignAll(await MissionApi.getMissionList());
    socialMissions.assignAll(await MissionApi.getMissionList(kind: "ETC"));

    mypage.value = await LoginApi.getDashBoard() ?? tmpDashBoard;
  }
}
