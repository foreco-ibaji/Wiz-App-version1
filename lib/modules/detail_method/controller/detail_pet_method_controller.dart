import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ibaji/model/category_method/category_method.dart';
import 'package:ibaji/model/detail_method/detail_method.dart';
import 'package:ibaji/model/disposal/disposalInfo.dart';
import 'package:ibaji/provider/api/trash_api.dart';
import 'package:logger/logger.dart';

import '../../../model/category/category.dart';
import '../../../model/detail/detail.dart';
import '../../../model/trash/trash.dart';

class DetailMethodPetController extends GetxController {
  static DetailMethodPetController get to => Get.find();
  RxList<bool> isExpansion = <bool>[false, false].obs;
  List<String> remarks = [
    "맥주, 소주, 사이다 등의 유색 페트병의 경우 내용물을 비우고 물로 내부를 세척해주세요.",
    "페트병 겉면에 붙어있는 상표 등의 비닐 라벨은 깨끗이 떼어내서 비닐로 분리배출 해주세요.",
    "페트병 뚜껑은 닫고 함께 버리거나, 따로 분리해서 버려도 무방합니다.",
    "용기 안에 담배꽁초, 휴지 등 이물질이 들어간 경우 재활용이 어렵기 때문에 종량제 봉투에 담아서 버려주세요."
  ];
  RxInt currentIdx = 0.obs;
  Rx<DetailMethod> detailMethod = DetailMethod(
      orderOfTab: 1,
      maxNumOfTab: 1,
      trashIcon: "trashIcon",
      titleOfTab: "titleOfTab",
      id: 1,
      isRecyclable: "isRecyclable",
      trashName: "trashName",
      disposalMethod: ["disposalMethod"],
      disposalInfo: DisposalInfo(days: ["days"], time: "time"),
      remark: [
        "맥주, 소주, 사이다 등의 유색 페트병의 경우 내용물을 비우고 물로 내부를 세척해주세요.",
        "페트병 겉면에 붙어있는 상표 등의 비닐 라벨은 깨끗이 떼어내서 비닐로 분리배출 해주세요.",
        "페트병 뚜껑은 닫고 함께 버리거나, 따로 분리해서 버려도 무방합니다.",
        "용기 안에 담배꽁초, 휴지 등 이물질이 들어간 경우 재활용이 어렵기 때문에 종량제 봉투에 담아서 버려주세요."
      ],
      plasticInfo: [
        PlasticInfo(remark: [''])
      ],
      examples: <Detail>[],
      recommendTrashes: <Trash>[]).obs;

  @override
  void onInit() async {
    super.onInit();
  }
}
