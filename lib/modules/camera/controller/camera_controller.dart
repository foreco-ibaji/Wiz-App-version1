import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:ibaji/provider/api/photo_api.dart';
import 'package:ibaji/provider/api/trash_api.dart';
import 'package:ibaji/provider/service/camera_service.dart';
import 'package:ibaji/util/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../detail_method/view/detail_method_view.dart';

class CameraScreenController extends GetxController {
  Rx<bool> isFlash = false.obs;
  RxString imagePath = ''.obs;

  ///* 이미지 선택
  Future<void> imagePick() async {
    Logger().d("이미지 선택");
    imagePath.value = await imageRegister();
    await PhotoRepository.getPhotoReuslt(imagePath.value);
  }

  ///* 휴대폰 내부 이미지 선택
  Future<String> imageRegister() async {
    final ImagePicker picker = ImagePicker();

    XFile? resultImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    return resultImage?.path ?? "";
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    CameraService.to.cameraController?.value.setExposurePoint(offset);
    CameraService.to.cameraController?.value.setFocusPoint(offset);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
}
