import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraResultController extends GetxController {
  static CameraResultController get to => Get.find();
  List<List<dynamic>> tmpResult = (Get.arguments['result']) ??
      ([
        ["비닐", 30, 48, 130, 140],
        ["플라스틱", 20, 48, 100, 140]
      ]);
  String photo = (Get.arguments['photo']) ?? "";
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

  @override
  void onInit() {}
}
