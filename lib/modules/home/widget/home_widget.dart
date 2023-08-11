import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/app_colors.dart';

class ImageWithCircle extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final int size;
  final Future<void> Function()? onTap;

  const ImageWithCircle(
      {super.key,
      required this.imagePath,
      this.size = 60,
      required this.backgroundColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13.h),
        width: size.w,
        height: size.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          "asset/image/object/iv_${imagePath}.png",
        ),
      ),
    );
  }
}

class ImageWithNetworkCircle extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final int size;
  final Future<void> Function()? onTap;

  const ImageWithNetworkCircle(
      {super.key,
      required this.imagePath,
      this.size = 60,
      required this.backgroundColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13.h),
        width: size.w,
        height: size.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Image.network(
          imagePath,
        ),
      ),
    );
  }
}
