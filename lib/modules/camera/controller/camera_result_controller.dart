import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';

import '../../../model/photo_result/photo_result.dart';
import '../../../provider/service/camera_service.dart';
import '../../../util/style/global_logger.dart';

class CameraResultController extends GetxController {
  final List<ResultDetail> results;

  CameraResultController(this.results);

  RxList<Uint8List> croppedImage = <Uint8List>[].obs;

  // RxList<List<dynamic>> tmpResult = [
  //   ["비닐", 148, 48, 752, 568],
  //   ["플라스틱", 148, 48, 752, 568]
  // ].obs;

  // Future<ByteData> loadImage() async {
  //   final ByteData data =
  //       await rootBundle.load('your_input_image_path.jpg'); // 원본 이미지 경로
  //   final List<int> bytes = data.buffer.asUint8List();

  //   return ByteData.sublistView(Uint8List.fromList(bytes));
  // }

  // Future<Image> cropImage(
  //     {required double startX,
  //     required double startY,
  //     required double endX,
  //     required double endY,
  //     required ByteData originImg}) async {
  //   final double width = endX - startX;
  //   final double height = endY - startY;
  //   final src = Rect.fromPoints(Offset(startX, startY), Offset(endX, endY));
  //   final dst = Rect.fromPoints(Offset(0, 0), Offset(src.width, src.height));

  //   final recorder = ui.PictureRecorder();
  //   final canvas = Canvas(recorder);

  //   final rawImage = Image.memory(Uint8List.sublistView(
  //       originImg.buffer.asUint8List(), startX * 4, startY, width, height));
  //   rawImage.paint(
  //       canvas,
  //       Rect.fromPoints(
  //           Offset(0, 0), Offset(width.toDouble(), height.toDouble())));

  //   final picture = recorder.endRecording();
  //   final img = await picture.toImage(width, height);

  //   croppedImage = Image.memory(Uint8List.fromList(
  //       img.toByteData(format: ui.ImageByteFormat.png)!.buffer.asUint8List()));
  // }

  Future<Uint8List?> cropImage(
      {required double startX,
      required double startY,
      required double endX,
      required double endY}) async {
    final ByteData bytes = await rootBundle.load(CameraService.imgPath.value);
    final List<int> byteList = bytes.buffer.asUint8List();
    // 이미지 데이터를 ui.Image로 디코드
    ui.Image originalImage = await ui
        .instantiateImageCodec(Uint8List.fromList(byteList))
        .then((codec) =>
            codec.getNextFrame().then((frameInfo) => frameInfo.image));

    if (originalImage == null) {
      return null; // 이미지 디코드 실패
    }

    // 자를 부분을 Rect로 정의
    Rect cropRect = Rect.fromPoints(
        Offset(startX.toDouble(), startY.toDouble()),
        Offset(endX.toDouble(), endY.toDouble()));

    // 자른 이미지를 그릴 Canvas 생성
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, cropRect);

    // 원본 이미지를 cropRect에 맞게 그림
    canvas.drawImageRect(
      originalImage,
      cropRect,
      Rect.fromPoints(Offset(0, 0), Offset(cropRect.width, cropRect.height)),
      Paint(),
    );

    // Canvas를 종료하고 Image로 변환
    final picture = recorder.endRecording();
    final img =
        await picture.toImage(cropRect.width.toInt(), cropRect.height.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      return null; // 변환 실패
    }

    // ByteData를 Uint8List로 변환하여 반환
    Uint8List croppedImageData = byteData.buffer.asUint8List();
    return croppedImageData;
  }

  @override
  void onInit() async {
    // for (final i in results) {
    //   var tmpImg = await cropImage(
    //     startX: i.coordinate[0].toDouble(),
    //     startY: i.coordinate[1].toDouble(),
    //     endX: i.coordinate[2].toDouble(),
    //     endY: i.coordinate[3].toDouble(),
    //   );
    //   if (tmpImg != null) {
    //     croppedImage.add(tmpImg!);
    //   }
    // }
    // logger.e(croppedImage);
  }
}
