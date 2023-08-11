import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageUtil {
  static Future<Uint8List?> resizeImage(String imagePath) async {
    var result = await FlutterImageCompress.compressWithFile(
      imagePath,
      minWidth: 40,
      minHeight: 40,
    );
    return result;
  }
}
