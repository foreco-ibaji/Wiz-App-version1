import 'package:get/get.dart';
import 'package:ibaji/model/detail_method/detail_method.dart';
import 'package:ibaji/modules/detail_method/widget/detail_widget.dart';
import 'package:ibaji/provider/api/trash_api.dart';
import '../../../model/disposal/disposalInfo.dart';
import '../../../model/trash/trash.dart';

class DetailMethodController extends GetxController {
  static DetailMethodController get to => Get.find();
  int id = Get.arguments['id'] ?? 1;
  // tmp id 변수
  Rx<DetailMethod> detailMethod = const DetailMethod(
          id: 1,
          detailType: "BIG",
          name: "trashName",
          disposalMethod: "disposalMethod",
          disposalInfoDto: DisposalInfo(days: [], time: ""),
          remark: [],
          iconUrl: "trashIcon")
      .obs;
  RxList<Trash> relationTrash = <Trash>[].obs;
  @override
  void onInit() async {
    //TODO: lateinit 에러
    detailMethod.value = await TrashRepository.getDetailMethod(id: id);
    relationTrash.value = await TrashRepository.getRelationTrash(id: id);
    super.onInit();
    if (detailMethod.value.detailType == "MAP") {
      Future.delayed(Duration.zero, () {
        Get.bottomSheet(
          MapNavigationBottomSheet(),
        );
      });
    }
  }
}
