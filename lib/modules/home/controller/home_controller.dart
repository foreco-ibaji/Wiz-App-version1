import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/provider/api/home_api.dart';
import 'package:ibaji/provider/api/util/map_api.dart';
import 'package:ibaji/provider/service/camera_service.dart';
import 'package:logger/logger.dart';
import '../../../model/category/category.dart';
import '../../../provider/api/trash_api.dart';

class HomeController extends GetxController {
  RxList<String> trashDay = <String>[].obs;
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  RxInt currentDayIdx = DateTime.now().weekday.obs;
  List<String> dayList = ['월', '화', '수', '목', '금', '토', '일'];
  RxInt tabIndex = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await Get.putAsync(() async => CameraService());
    await CameraService.to.initCamera();
    //TODO: 월요일 -> 월로 통일
    var tmpList =
        await HomeRepository.getCalendar(dayList[currentDayIdx.value - 1]);
    trashDay.assignAll(tmpList);
  }
}
