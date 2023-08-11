import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  RxBool isSearch = false.obs;
  List<String> itemList = ['음식물이 묻은 쓰레기'];
  RxList<String> searchResults = <String>[].obs;

  void search(String query) {
    for (String item in itemList) {
      if (dfsSearch(item.toLowerCase(), query.toLowerCase())) {
        searchResults.add(item);
      }
    }
  }

  bool dfsSearch(String item, String query) {
    if (item.startsWith(query)) {
      return true;
    }

    for (int i = 0; i < item.length; i++) {
      if (item[i] == query[0]) {
        if (dfsSearch(item.substring(i + 1), query.substring(1))) {
          return true;
        }
      }
    }

    return false;
  }
}
