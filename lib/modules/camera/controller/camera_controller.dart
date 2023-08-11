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

import '../../detail_method/view/detail_methd_pet_view.dart';
import '../../detail_method/view/detail_method_view.dart';

class CameraScreenController extends GetxController {
  Rx<bool> isCamera = true.obs;
  Rx<bool> isFlash = false.obs;
  RxString imagePath = ''.obs;
  RxString scanBarcode = ''.obs;

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', '돌아가기', true, ScanMode.BARCODE);
      if (barcodeScanRes != "") {
        Get.to(DetailMethodScreen(), arguments: {'trash': '종이팩'});
      }
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    scanBarcode.value = barcodeScanRes;
  }

  ///* 이미지 선택
  Future<void> imagePick() async {
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
