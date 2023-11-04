import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ibaji/model/detail_method/detail_method.dart';
import 'package:ibaji/modules/detail_method/widget/detail_widget.dart';
import 'package:ibaji/provider/api/trash_api.dart';
import '../../../model/disposal/disposalInfo.dart';
import '../../../model/trash/trash.dart';

class DetailMethodController extends GetxController {
  int id = Get.arguments['id'] ?? 0;

  static DetailMethodController get to => Get.find();
  Rx<ScrollController> scrollController = ScrollController().obs;

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

  Future<void> scrollToTop() async {
    await scrollController.value.animateTo(
      0.0, // 맨 위로 스크롤
      duration: Duration(milliseconds: 100), // 스크롤 애니메이션 지속 시간
      curve: Curves.bounceIn, // 애니메이션 커브
    );
  }

  @override
  void onInit() async {
    //TODO: lateinit 에러
    detailMethod.value = await TrashRepository.getDetailMethod(id: id);
    relationTrash.value = await TrashRepository.getRelationTrash(id: id);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
