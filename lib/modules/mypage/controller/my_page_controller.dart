import 'package:get/get.dart';
import 'package:ibaji/model/dashboard/dashboard.dart';
import 'package:ibaji/provider/api/login_api.dart';
import 'package:ibaji/provider/api/util/global_mock_data.dart';

class MyPageController extends GetxController {
  Rx<Dashboard> mypage = tmpDashBoard.obs;

  @override
  void onInit() async {
    super.onInit();

    mypage.value = await LoginApi.getDashBoard() ?? tmpDashBoard;
  }
}
