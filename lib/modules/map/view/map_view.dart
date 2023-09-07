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

import '../../../provider/api/public_api.dart';
import '../../../util/routes/routes.dart';
import '../../../provider/service/map_service.dart';
import '../controller/map_controller.dart';
import '../widget/map_widget.dart';

class MapScreen extends GetView<MapController> {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: 라우팅 전체 설정전 임시 처리
    Get.put(MapController());
    Logger().d(kToolbarHeight);
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: kToolbarHeight,
      //   backgroundColor: AppColors.black,
      //   centerTitle: true,
      //   title: Text(
      //     textAlign: TextAlign.center,
      //     "배출함 지도",
      //     style: AppTextStyles.title1SemiBold,
      //   ),
      // ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 33.h)
                  .copyWith(bottom: 14.h),
              child: Column(
                children: [
                  //1.Appbar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "asset/image/icon/ic_arrow_left_14.svg",
                        width: 14.w,
                        color: AppColors.black,
                      ),
                      Text(
                        "수거함 지도",
                        style: AppTextStyles.title2SemiBold,
                      ),
                      GestureDetector(
                        onTap: (() {
                          Get.back();
                        }),
                        child: SvgPicture.asset(
                          "asset/image/icon/ic_home_back_24.svg",
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  //2. 현재 위치
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "asset/image/icon/ic_location_24.svg",
                      ),
                      Text(
                        MapService.currentAddress.join(' '),
                        style: AppTextStyles.title3Medium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  //3. 아이콘 스타일 선택
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.placeType.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 8.w,
                          );
                        },
                        itemBuilder: ((context, index) {
                          return Obx(() => GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: (() async {
                                if (index != 0) {
                                  MapService.to
                                      .markers[controller.placeEngType[index]]
                                      ?.forEach((element) {
                                    element.setIsVisible(true);
                                  });
                                  MapService
                                      .to
                                      .markers[
                                          controller.placeEngType[3 - index]]
                                      ?.forEach((element) {
                                    element.setIsVisible(false);
                                  });
                                  Logger().d("dfd");
                                } else if (controller.isSelected.value != 0 &&
                                    index == 0) {
                                  MapService.to.markers['cloth']
                                      ?.forEach((element) {
                                    element.setIsVisible(true);
                                  });
                                  MapService.to.markers['bolt']
                                      ?.forEach((element) {
                                    element.setIsVisible(true);
                                  });
                                  Logger().d("hjhkhk");
                                }
                                controller.isSelected.value = index;
                              }),
                              child: MapTypeChip(
                                  isSelected:
                                      index == controller.isSelected.value,
                                  text: controller.placeType[index])));
                        })),
                  ),
                ],
              ),
            ),
            Expanded(
              child: NaverMap(
                options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(
                    target: NLatLng(
                        MapService.currentLatLng.value.latitude,
                        MapService
                            .currentLatLng.value.longitude), // 초기 지도 위치 설정
                    zoom: 15.0,
                  ),
                ),
                onMapReady: ((mapController) async {
                  MapService.naverMapController = mapController;
                  MapService.to.markers.keys.forEach((element) async {
                    await mapController
                        .addOverlayAll(MapService.to.markers[element] ?? {})
                        .then((marker) async {
                      Logger().d(MapService.to.markers.length);
                      try {
                        return true;
                      } catch (e) {
                        Logger().d(e);
                      }
                      ;
                    });
                  });
                }),
              ),
            )
            // Expanded(
            //   child: GoogleMap(
            //     zoomControlsEnabled: false,
            //     markers: MapService.to.markers,
            //     onMapCreated: ((GoogleMapController mapController) async {
            //       MapService.to.googleMapController = mapController;
            //       await controller.getCurrentLocation();
            //       // await ClothApi.getClothPlace();
            //       // var tmpList = await ClothApi.getClothPlace() ?? [];
            //     }),
            //     polylines: Set<Polyline>.of(MapService.to.polylines.values),
            //     initialCameraPosition: CameraPosition(
            //       target: controller.initialPosition.value, // 초기 지도 위치 설정
            //       zoom: 13.0,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
