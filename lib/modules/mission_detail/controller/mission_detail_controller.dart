import 'package:get/get.dart';

import '../../../model/mission_detail/mission_detail.dart';
import '../../../provider/api/mission_api.dart';
import '../../../provider/api/util/global_mock_data.dart';
import '../../../util/style/global_logger.dart';

class MissionDetailController extends GetxController {
  final int missionId = Get.arguments['missionId'] ?? -1;
  Rx<MissionDetail> missionDetail = tmpMissionDetail.obs;
  Rx<int> currentChocieId = (-1).obs;

  @override
  void onInit() async {
    super.onInit();
    logger.e("Fdsf");
    missionDetail.value =
        await MissionApi.getMissionDetail(missionId: missionId) ??
            tmpMissionDetail;
  }
}
