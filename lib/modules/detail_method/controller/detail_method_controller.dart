import 'package:get/get.dart';
import 'package:ibaji/model/detail_method/detail_method.dart';
import 'package:ibaji/provider/api/trash_api.dart';
import '../../../model/trash/trash.dart';

class DetailMethodController extends GetxController {
  static DetailMethodController get to => Get.find();
  // String trash = Get.arguments['trash'];
  //TODO: tmp id 변수
  int id = 1;
  late Rx<DetailMethod> detailMethod;
  late RxList<Trash> relationTrash;
  @override
  void onInit() async {
    detailMethod.value = await TrashRepository.getDetailMethod(id: id);
    relationTrash.value = await TrashRepository.getRelationTrash(id: id);
    super.onInit();
  }
}
