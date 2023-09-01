import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ibaji/modules/detail_method/view/detail_method_view.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:logger/logger.dart';

import '../../../provider/api/photo_api.dart';
import '../../../provider/service/camera_service.dart';
import '../../../util/app_text_styles.dart';
import '../../../util/permission_handler.dart';
import '../controller/camera_controller.dart';

class CameraScreen extends GetView<CameraScreenController> {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (() {
                          Get.back();
                        }),
                        icon: Icon(
                          Icons.close,
                          size: 24,
                          color: AppColors.white,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: 168.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000.r),
                                color: AppColors.grey1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.isCamera.value
                                    ? Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 3.h),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary7,
                                            borderRadius:
                                                BorderRadius.circular(100.r),
                                          ),
                                          child: Text(
                                            "이미지",
                                            style: AppTextStyles.title3Bold
                                                .copyWith(
                                                    color: AppColors.grey9),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: GestureDetector(
                                          onTap: (() {
                                            controller.isCamera.value = true;
                                          }),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "이미지",
                                            style: AppTextStyles.title3Bold
                                                .copyWith(
                                                    color: AppColors.grey3),
                                          ),
                                        ),
                                      ),
                                controller.isCamera.value
                                    ? Expanded(
                                        child: GestureDetector(
                                          onTap: (() async {
                                            controller.isCamera.value = false;
                                            await controller
                                                .scanBarcodeNormal();
                                          }),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "바코드",
                                            style: AppTextStyles.title3Bold
                                                .copyWith(
                                                    color: AppColors.grey3),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 3.h),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary7,
                                            borderRadius:
                                                BorderRadius.circular(100.r),
                                          ),
                                          child: Text(
                                            "바코드",
                                            style: AppTextStyles.title3Bold
                                                .copyWith(
                                                    color: AppColors.grey9),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                controller.isCamera.value
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 510.h,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CameraPreview(
                                CameraService.to.cameraController?.value ??
                                    CameraController(
                                      CameraService.to.cameras[0],
                                      ResolutionPreset.medium,
                                      imageFormatGroup: ImageFormatGroup.jpeg,
                                    ),
                              ),
                              cameraOverlay(
                                  padding: 50,
                                  aspectRatio: 1,
                                  color: AppColors.black.withOpacity(0.5)),
                              Positioned(
                                  top: 30.h,
                                  left: 50.w,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 27.w, vertical: 7.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1000.r),
                                        color:
                                            AppColors.black.withOpacity(0.3)),
                                    child: Text(
                                      "해당 쓰레기를 사각형안에 위치시켜주세요.",
                                      style: AppTextStyles.title3Medium,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 65.h, horizontal: 52.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            if (await PermissionHandler()
                                .requestGallery(context)) {
                              controller.imagePick();
                            }
                          },
                          child: Image.asset(
                            "asset/image/icon/ic_gallery_30.png",
                            width: 30.w,
                          )),
                      GestureDetector(
                          onTap: () async {
                            var img = await CameraService.to.takePhoto();
                            // var result = await PhotoRepository.getPhotoReuslt(
                            //     img?.path ?? "");
                            // if (result.isNotEmpty) {
                            // if (CameraService.to.cameraController?.value !=
                            //     null) {
                            //   await CameraService.to.stopImageStream();
                            // }

                            await Get.to(() => DetailMethodScreen(),
                                arguments: {'trash': '비닐봉지'});
                            // } else {
                            // Fluttertoast.showToast(
                            // msg: "조회되지 않습니다. 다시 시도해주세요");
                            // }
                          },
                          child: Image.asset(
                            "asset/image/icon/ic_camera_press.png",
                            width: 68.w,
                          )),
                      !controller.isFlash.value
                          ? GestureDetector(
                              onTap: () async {
                                await CameraService.to.cameraController?.value
                                    .setFlashMode(FlashMode.torch);
                                controller.isFlash.value = true;
                                Logger().d(controller.isFlash.value);
                              },
                              child: Image.asset(
                                "asset/image/icon/ic_flash_unable_30.png",
                                width: 30.w,
                              ))
                          : GestureDetector(
                              onTap: () async {
                                await CameraService.to.cameraController?.value
                                    .setFlashMode(FlashMode.off);
                                controller.isFlash.value = false;
                                Logger().d(controller.isFlash.value);
                              },
                              child: Image.asset(
                                "asset/image/icon/ic_flash_able_30.png",
                                width: 30.w,
                              )),
                    ],
                  ),
                )
              ],
            )));
  }
}

Widget cameraOverlay(
    {required double padding,
    required double aspectRatio,
    required Color color}) {
  return LayoutBuilder(builder: (context, constraints) {
    double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
    double horizontalPadding;
    double verticalPadding;

    if (parentAspectRatio < aspectRatio) {
      horizontalPadding = padding;
      verticalPadding = (constraints.maxHeight -
              ((constraints.maxWidth - 2 * padding) / aspectRatio)) /
          2;
    } else {
      verticalPadding = padding;
      horizontalPadding = (constraints.maxWidth -
              ((constraints.maxHeight - 2 * padding) * aspectRatio)) /
          2;
    }
    return Stack(fit: StackFit.expand, children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Container(width: horizontalPadding, color: color)),
      Align(
          alignment: Alignment.centerRight,
          child: Container(width: horizontalPadding, color: color)),
      Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: EdgeInsets.only(
                  left: horizontalPadding, right: horizontalPadding),
              height: verticalPadding,
              color: color)),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.only(
                  left: horizontalPadding, right: horizontalPadding),
              height: verticalPadding,
              color: color)),
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary7, width: 2)),
      )
    ]);
  });
}
