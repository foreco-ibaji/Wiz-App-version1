import 'package:get/get.dart';

import '../../../model/mission_detail/mission_detail.dart';
import '../../../provider/api/util/global_mock_data.dart';

class MissionDetailController extends GetxController {
  final int missionId = Get.arguments['missionId'] ?? -1;
  Rx<MissionDetail> missionDetail = tmpMissionDetail.obs;
  Rx<int> currentChocieId = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    //TODO: get mission detail data from server
  }
}
