import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService extends GetxService {
  static CameraService get to => Get.find();
  List<CameraDescription> cameras = <CameraDescription>[].obs;
  Rx<CameraController>? cameraController;
  Rx<bool> _isImageStreaming = false.obs;
  Future<void> initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();

      cameraController = CameraController(
        cameras[0],
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.jpeg,
      ).obs;
      await cameraController?.value.initialize();
    } else {
      Logger().d('d');
    }
  }

  Future<XFile?> takePhoto() async {
    final path = 'path/to/save/image.jpg';

    try {
      final XFile imageFile =
          await cameraController?.value.takePicture() ?? XFile(path);
      // 사진 촬영이 완료되면 해당 경로에 이미지가 저장됩니다.

      Logger().d('사진이 저장되었습니다 ${imageFile.path}');
      return imageFile;
    } catch (e) {
      print('사진 촬영 중 오류 발생: $e');
    }
  }

  Future<void> stopImageStream() async {
    if (_isImageStreaming.value) {
      await cameraController?.value.stopImageStream();
      _isImageStreaming.value = false; // 이미지 스트림이 멈춤을 표시
    }
  }
}
