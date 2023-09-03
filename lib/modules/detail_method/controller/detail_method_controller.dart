import 'package:get/get.dart';
import 'package:ibaji/model/detail_method/detail_method.dart';
import 'package:ibaji/provider/api/trash_api.dart';
import '../../../model/disposal/disposalInfo.dart';
import '../../../model/trash/trash.dart';

class DetailMethodController extends GetxController {
  static DetailMethodController get to => Get.find();
  // String trash = Get.arguments['trash'];
  // tmp id 변수
  int id = 1;
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
  }
}
