import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ibaji/provider/api/home_api.dart';
import 'package:ibaji/provider/service/camera_service.dart';
import 'package:logger/logger.dart';
import '../../../model/category/category.dart';
import '../../../provider/api/trash_api.dart';

class HomeController extends GetxController {
  RxList<String> trashDay = <String>[].obs;
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  Map<String, String> frequentTrashText = {
    '비닐봉지': 'plastic_bag_160',
    '과일껍데기': 'fruit_skin_160',
    '계란껍데기': 'egg_trash_160',
    '배달용기': 'delivery_container_40',
    '음식 뼈': 'food_bone_40',
    '이불': 'blanket_40',
    '걸레': 'cleaning_tool_40',
    '종이팩': 'paper_pack_40'
  };
  // //TODO: 추후 DB에서 불러올 정보
  // Map<String, String> trashDay = {
  //   '종이': 'paper_30',
  //   '금속': 'metal_34',
  //   '병': 'bottle_34',
  //   '플라스틱': 'plastic_spray_34',
  // };

  RxInt currentDayIdx = 0.obs;
  List<String> dayList = ['월', '화', '수', '목', '금', '토', '일'];
  @override
  void onInit() async {
    super.onInit();
    await Get.putAsync(() async => CameraService());
    await CameraService.to.initCamera();

    currentDayIdx.value = DateTime.now().weekday - 1;
    //TODO: 월요일 -> 월로 통일
    var tmpList =
        await HomeRepository.getCalendar(dayList[currentDayIdx.value] + '요일');
    trashDay.assignAll(tmpList);
  }
}
