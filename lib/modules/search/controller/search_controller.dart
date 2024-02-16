import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibaji/model/search_detail/search_detail.dart';
import 'package:ibaji/provider/api/home_api.dart';
import 'package:ibaji/provider/storage/get_storage_util.dart';
import 'package:ibaji/util/style/global_logger.dart';

import '../../../model/trash/trash.dart';

class SearchViewController extends GetxController {
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  RxBool isSearch = false.obs;
  List<String> itemList = ['음식물이 묻은 쓰레기'];
  RxList<Trash> searchResults = <Trash>[].obs;
  RxList<SearchDetail> latestSearches = <SearchDetail>[].obs;

  Future<void> getSearchResult(String keyword) async {
    var tmpList = await HomeRepository.getSearch(keyword);

    searchResults.assignAll(tmpList);
  }

  void onLatestClear() {
    logger.d("onLatestClear Called");
    latestSearches.clear();
    GetStorageUtil.delAllLatestSearches();
  }

  void onSearch() {
    logger.d("onSearch Called");

    final String searchText = searchTextController.value.text;
    latestSearches.value = _changeLatestSearch(searchText).obs;
    GetStorageUtil.setLatestSearches(latestSearches);
  }

  List<SearchDetail> _changeLatestSearch(String text) {
    List<SearchDetail> current = latestSearches;
    bool isSearchedBefore = current.any((element) => element.text == text);

    if (isSearchedBefore) {
      int target = current.indexWhere((element) => element.text == text);

      current[target] =
          SearchDetail(text: current[target].text, dateTime: DateTime.now());
    } else {
      current.add(SearchDetail(text: text, dateTime: DateTime.now()));
    }

    current.sort((e1, e2) => -e1.dateTime.compareTo(e2.dateTime));
    return current.toList();
  }

  void onRemoveLatestItem(int index) {
    logger.d("onRemove($index) Called");
    List<SearchDetail> current = latestSearches;

    current.removeAt(index);

    latestSearches.value = current.obs;
    GetStorageUtil.setLatestSearches(current);
  }

  @override
  void onInit() async {
    super.onInit();
    latestSearches.value = await GetStorageUtil.getLatestSearches();
  }

  @override
  void onClose() {
    searchTextController.value.dispose();
  }
}
