import 'package:dio/dio.dart';
import 'package:ibaji/provider/api/util/dio_services.dart';

import '../../model/mission/mission.dart';
import '../../model/mission_detail/mission_detail.dart';
import '../../util/style/global_logger.dart';
import 'util/global_api_field.dart';

const MISSION = "missions";

class MissionApi {
  ///<h2>미션 리스트 반환</h2>
  static Future<List<Mission>> getMissionList(
      {String kind = "WIZ", String? difficulty}) async {
    try {
      var queryParam = <String, dynamic>{};
      if (difficulty != null) {
        queryParam['difficulty'] = difficulty;
      }
      queryParam["kind"] = kind;
      Response response =
          await DioServices().to().get("/mission", queryParameters: queryParam);
      logger.e(response.data[DATA][MISSION].length);
      return List.generate(response.data[DATA][MISSION].length,
          (index) => Mission.fromJson(response.data[DATA][MISSION][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>쓰레기 미션 detail get</h2>
  static Future<MissionDetail?> getMissionDetail(
      {required int missionId}) async {
    try {
      Response response = await DioServices().to().get("/mission/$missionId");
      logger.e(MissionDetail.fromJson(response.data[DATA]));
      return MissionDetail.fromJson(response.data[DATA]);
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }

  ///<h2>요청 결과 반영</h2>
  static Future<int> setMissionResult(
      {required int missionId, required bool isSuccess}) async {
    try {
      Response response =
          await DioServices().to().post("/mission/result", data: {
        "missionId": missionId,
        "isSuccess": isSuccess,
      });

      return response.data[DATA]["userPoint"];
    } catch (e) {
      logger.e(e.toString());
      return -1;
    }
  }
}
