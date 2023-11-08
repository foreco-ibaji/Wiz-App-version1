import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/camera/controller/camera_controller.dart';
import 'package:ibaji/modules/camera/controller/camera_result_controller.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import '../../../model/photo_result/photo_result.dart';

class CameraResultScreen extends GetView<CameraResultController> {
  final List<ResultDetail> resultList;

  const CameraResultScreen({super.key, required this.resultList});

  @override
  Widget build(BuildContext context) {
    Get.put(CameraResultController(resultList));
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
                        var startX = resultList[index].coordinate[0].toDouble();
                        var startY = resultList[index].coordinate[1].toDouble();
                        var endX = resultList[index].coordinate[2].toDouble();
                        var endY = resultList[index].coordinate[3].toDouble();
                        return ResultContainer(
                            image: Container(
                              alignment: Alignment.topCenter,
                              width: 60.w,
                              height: 80.w,
                              // decoration: const BoxDecoration(
                              //   shape: BoxShape.circle,
                              // ),
                              child: ClipRect(
                                clipBehavior: Clip.hardEdge,
                                clipper: MyCustomClippers(
                                    startX: startX,
                                    startY: startY,
                                    endX: endX,
                                    endY: endY), // 특정 좌표 부분을 클리핑하는 클리퍼 사용
                                child: Image.file(
                                  File(CameraScreenController
                                      .to.imagePath.value),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            title: resultList[index].name,
                            description:
                                "이부분은 ${resultList[index].name}로 버려주세요");
                      }),
                      separatorBuilder: ((context, index) {
                        return SizedBox(
                          height: 12.h,
                        );
                      }),
                      itemCount: resultList.length)
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
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h).copyWith(top:0.h),
      child: Row(
        children: [
          //임시 하드코딩
          image,
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

//
// class ImageCropperPainter extends CustomPainter {
//   final double startX;
//   final double startY;
//   final double endX;
//   final double endY;
//
//   ImageCropperPainter(
//       {super.repaint,
//       required this.startX,
//       required this.startY,
//       required this.endX,
//       required this.endY});
//
//   //TODO: 이미지
//   @override
//   void paint(Canvas canvas, Size size) async {
//     // final ByteData data =
//     //     ('asset/image/object/iv_egg_trash_160.png');
//     try {
//       final ByteData bytes = await rootBundle.load(CameraService.imgPath.value);
//       final List<int> byteList = bytes.buffer.asUint8List();
//       final img.Image? image = img.decodeImage(Uint8List.fromList(byteList));
//       logger.e(image);
//       if (image != null) {
//         final ui.Codec codec =
//             await ui.instantiateImageCodec(Uint8List.fromList(byteList));
//         final ui.FrameInfo frameInfo = await codec.getNextFrame();
//         final ui.Image uiImage = frameInfo.image;
//         final paint = Paint()..isAntiAlias = true;
//
//         // 이미지를 특정 좌표 범위에 그리기
//         final srcRect = Rect.fromPoints(
//           Offset(0, 0),
//           Offset(image.width.toDouble(), image.height.toDouble()),
//         );
//         final destRect =
//             Rect.fromPoints(Offset(startX, startY), Offset(endX, endY));
//
//         // 'ui.Image'를 사용하여 이미지를 그립니다.
//         canvas.drawImageRect(
//           uiImage,
//           srcRect,
//           destRect,
//           paint,
//         );
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
