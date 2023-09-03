import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ibaji/provider/api/home_api.dart';

import '../../../model/trash/trash.dart';

class SearchController extends GetxController {
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  RxBool isSearch = false.obs;
  List<String> itemList = ['음식물이 묻은 쓰레기'];
  RxList<Trash> searchResults = <Trash>[].obs;

  Future<void> getSearchResult(String keyword) async {
    var tmpList = await HomeRepository.getSearch(keyword);
    searchResults.assignAll(tmpList);
  }

  @override
  void onInit() async {}
}
