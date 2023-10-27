import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/mission/controller/mission_controller.dart';
import '../../../util/app_colors.dart';
import '../../camera/view/camera_view.dart';
import '../../home/view/home_view.dart';

class MissionScreen extends GetView<MissionController> {
  const MissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("준비중인 기능입니다")),
    );
  }
}
