import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibaji/util/app_colors.dart';
import 'package:ibaji/util/app_text_styles.dart';
import 'package:logger/logger.dart';

import '../../../provider/api/cloth_api.dart';
import '../../../provider/api/light_api.dart';
import '../../../provider/routes/routes.dart';
import '../../../provider/service/map_service.dart';
import '../controller/map_controller.dart';

class MapScreen extends GetView<MapController> {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Logger().d(kToolbarHeight);
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(
          textAlign: TextAlign.center,
          "배출함 지도",
          style: AppTextStyles.title1SemiBold,
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  statusBarHeight,
              child: GoogleMap(
                zoomControlsEnabled: false,
                markers: PolyService.to.markers,
                onMapCreated: ((GoogleMapController mapController) async {
                  PolyService.to.googleMapController = mapController;
                  await controller.getCurrentLocation();
                  // await ClothApi.getClothPlace();
                  // var tmpList = await ClothApi.getClothPlace() ?? [];
                }),
                polylines: Set<Polyline>.of(PolyService.to.polylines.values),
                initialCameraPosition: CameraPosition(
                  target: controller.initialPosition.value, // 초기 지도 위치 설정
                  zoom: 13.0,
                ),
              ),
            ),
            Positioned(
              top: 24.w,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40.h,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.placeType.length + 1,
                    itemBuilder: ((context, index) {
                      if (index != 0) {
                        return Obx(
                          () => GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: (() {
                              controller.isSelected.value = index;

                              Set<Marker> visibleMarkers = PolyService
                                  .to.markers
                                  .where((marker) =>
                                      marker.markerId.value.startsWith('bolt'))
                                  .toSet();
                              //  visibleMarkers.forEach((element) {element.visible = false;})
                            }),
                            child: Container(
                              margin: index == controller.placeType.length
                                  ? EdgeInsets.symmetric(horizontal: 6.w)
                                      .copyWith(right: 36.w)
                                  : EdgeInsets.symmetric(horizontal: 6.w),
                              decoration: BoxDecoration(
                                color: controller.isSelected.value == index
                                    ? AppColors.primary5
                                    : AppColors.grey1,
                                borderRadius: BorderRadius.circular(1000.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 6.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "asset/image/object/map/ic_${controller.placeType.values.elementAt(index - 1)}_20.png",
                                    width: 15.w,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    controller.placeType.keys
                                            .elementAt(index - 1) +
                                        "함",
                                    style: controller.isSelected.value == index
                                        ? AppTextStyles.title3Bold
                                            .copyWith(color: AppColors.grey1)
                                        : AppTextStyles.title3Medium
                                            .copyWith(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Obx(
                          () => GestureDetector(
                            onTap: (() {
                              controller.isSelected.value = 0;
                            }),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.w)
                                  .copyWith(left: 26.w),
                              decoration: BoxDecoration(
                                color: controller.isSelected.value == 0
                                    ? AppColors.primary5
                                    : AppColors.grey1,
                                borderRadius: BorderRadius.circular(1000.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 6.h),
                              child: Text(
                                textAlign: TextAlign.center,
                                "전체",
                                style: controller.isSelected.value == 0
                                    ? AppTextStyles.title3Bold
                                        .copyWith(color: AppColors.grey1)
                                    : AppTextStyles.title3Medium
                                        .copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        );
                      }
                    })),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: 338.w,
            height: 72.w,
            margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 42.h),
            padding: EdgeInsets.symmetric(horizontal: 63.w, vertical: 11.h),
            decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.circular(36.r)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (() async {
                    await Get.offAllNamed(Routes.home);
                  }),
                  child: Column(children: [
                    SvgPicture.asset("asset/image/icon/ic_home_24_unable.svg"),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text("홈",
                        style: AppTextStyles.title3Medium
                            .copyWith(color: AppColors.grey3))
                  ]),
                ),
                GestureDetector(
                  onTap: (() async {}),
                  child: Column(children: [
                    SvgPicture.asset("asset/image/icon/ic_map_26_able.svg"),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text("배출함 지도", style: AppTextStyles.title3Medium)
                  ]),
                )
              ],
            ),
          ),
          Positioned(
            left: 152.w,
            child: GestureDetector(
              onTap: (() async {
                await Get.toNamed(Routes.camera);
              }),
              child: Container(
                padding: EdgeInsets.all(18.h),
                width: 75.w,
                height: 75.w,
                decoration: BoxDecoration(
                    color: AppColors.primary7,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.grey1, width: 4.w)),
                child: SvgPicture.asset(
                  "asset/image/icon/ic_camera_34.svg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
