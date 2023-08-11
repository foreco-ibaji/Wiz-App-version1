import 'package:get/get.dart';

import '../controller/category_method_controller.dart';

class CategoryMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryMethodController());
  }
}
