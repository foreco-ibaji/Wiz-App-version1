import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/camera/controller/camera_controller.dart';
import 'package:ibaji/modules/camera/controller/camera_result_controller.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'dart:ui' as ui;

import 'package:logger/logger.dart';

class CameraResultScreen extends GetView<CameraResultController> {
  const CameraResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: 임시 라우팅
    Get.put(CameraResultController());
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      "asset/image/icon/ic_home_back_24.svg",
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  //TODO:그림자,radius
                  Container(
                    width: 160.w,
                    height: 160.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(
                              File(CameraScreenController.to.imagePath.value),
                            ),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.darken))),
                  ),
                  // Image.asset(
                  //   "asset/image/object/iv_egg_trash_160.png",
                  //   width: 180.w,
                  // ),
                  SizedBox(
                    height: 42.h,
                  ),
                  Text(
                    "이렇게 분리배출해주세요",
                    style: AppTextStyles.heading3Bold,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return ResultContainer(
                            // image: Image(image: ImageProvider()),
                            image: CustomPaint(
                              size: Size(40, 40), // 원하는 이미지 크기로 조절
                              painter: ImageCropperPainter(
                                startX:
                                    controller.tmpResult[index][1].toDouble(),
                                startY:
                                    controller.tmpResult[index][2].toDouble(),
                                endX: controller.tmpResult[index][3].toDouble(),
                                endY: controller.tmpResult[index][4].toDouble(),
                              ), // 커스텀 페인터 사용
                            ),
                            title: controller.tmpResult[index][0],
                            description:
                                "이부분은 ${controller.tmpResult[index][0]}로 버려주세요");
                      }),
                      separatorBuilder: ((context, index) {
                        return SizedBox(
                          height: 12.h,
                        );
                      }),
                      itemCount: controller.tmpResult.length)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ResultContainer(
      {required Widget image,
      required String title,
      required String description}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      width: 335.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r), color: AppColors.grey1),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      child: Row(
        children: [
          //임시 하드코딩
          CircleAvatar(
            radius: 40.w,
            child: image,
          ),
          SizedBox(
            width: 18.w,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: AppTextStyles.title2Bold,
              ),
              SizedBox(height: 8.h),
              Text(
                description,
                style: AppTextStyles.title3Medium,
                maxLines: 3,
              )
            ]),
          )
        ],
      ),
    );
  }
}

class ImageCropperPainter extends CustomPainter {
  final double startX;
  final double startY;
  final double endX;
  final double endY;

  ImageCropperPainter(
      {super.repaint,
      required this.startX,
      required this.startY,
      required this.endX,
      required this.endY});
  //TODO: 이미지
  @override
  void paint(Canvas canvas, Size size) async {
    // final ByteData data =
    //     await rootBundle.load('asset/image/object/iv_egg_trash_160.png');
    try {
      final Uint8List? bytes =
          await CameraResultController.to.photo?.readAsBytes();
      final ui.Codec codec = await ui.instantiateImageCodec(bytes!);
      final ui.FrameInfo frameInfo = await codec.getNextFrame();
      final ui.Image uiImage = frameInfo.image;
      final paint = Paint()..isAntiAlias = true;

      // 이미지를 특정 좌표 범위에 그리기
      final rect = Rect.fromPoints(Offset(startX, startY), Offset(endX, endY));
      final srcRect = Rect.fromPoints(
        Offset(0, 0),
        Offset(uiImage.width.toDouble() ?? 0, uiImage.height.toDouble() ?? 0),
      );
      Logger().d(uiImage.width.toDouble());
      // 'image' 변수를 'ui.Image'로 형변환합니다.
      canvas.drawImageRect(
        uiImage,
        srcRect,
        rect,
        paint,
      );
    } catch (e) {
      Logger().d(e.toString());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
