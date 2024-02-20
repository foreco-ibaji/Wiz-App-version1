import 'package:get/get.dart';
import 'package:ibaji/modules/search/controller/search_controller.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchViewController());
  }
}
