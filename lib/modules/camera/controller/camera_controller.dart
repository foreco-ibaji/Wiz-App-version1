import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ibaji/provider/api/photo_api.dart';
import 'package:ibaji/provider/service/camera_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import '../../../util/routes/routes.dart';
import '../view/camera_result_view.dart';

class CameraScreenController extends GetxController {
  static CameraScreenController get to => Get.find();
  Rx<bool> isFlash = false.obs;
  RxString imagePath = ''.obs;
  XFile? resultImage;

  //"{\"bboxes\":[[\"비닐\",148,48,7            52,568]]}"
  ///* 이미지 선택
  Future<String> imagePick() async {
    Logger().d("1. 이미지 선택");
    imagePath.value = await imageRegister();
    return imagePath.value;
  }

  ///* 휴대폰 내부 이미지 선택
  Future<String> imageRegister() async {
    final ImagePicker picker = ImagePicker();

    resultImage = await picker.pickImage(
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

  ///* 이미지 api 호출 및 라우팅 처리
  Future<void> getImgResult(String imgPath) async {
    CameraService.setImagePath(imgPath);
    var result = await PhotoRepository.getPhotoReuslt(imgPath);

    ///* 1. result가 빈리스트로 반환될때 ; ai 모델이 전혀 감지하지 못했을 때
    if (result.isEmpty) {
      Fluttertoast.showToast(msg: "인식할수 없습니다. 다시 시도해주세요");
    }

    ///* 2. 단일재질 분리수거 가능 물품일때 상세페이지로 이동
    /// ai 서버와 DB 데이터가 일치하지않을 경우도 분기처리에 포함
    else if (result.length == 1 && result[0].id != -1) {
      ///*2-2 상세페이지로 이동
      await Get.toNamed(Routes.detail, arguments: {'id': result[0].id});
    }

    ///* 3. 다중재질 분리수거 가능 물품일때 상세페이지로 이동
    else {
      Get.to(CameraResultScreen(
        resultList: result,
      ));
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
}

class MyCustomClippers extends CustomClipper<Rect> {
  final double startX;
  final double startY;
  final double endX;
  final double endY;

  MyCustomClippers({
    required this.startX,
    required this.startY,
    required this.endX,
    required this.endY,
  });

  @override
  Rect getClip(Size size) {
    final path = Rect.fromLTRB(startX, startY, endX, endY); // 클리핑할 영역을 지정
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true; // 항상 업데이트가 필요한 경우
  }
}