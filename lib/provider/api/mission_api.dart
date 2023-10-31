import 'package:dio/dio.dart';
import 'package:ibaji/provider/api/util/dio_services.dart';

import '../../model/mission/mission.dart';
import '../../model/mission_detail/mission_detail.dart';
import '../../util/style/global_logger.dart';
import 'util/global_api_field.dart';

class MissionApi {

  ///<h2>미션 리스트 반환</h2>
  static Future<List<Mission>> getMissionList(
      {required String kind, required String difficulty}) async {
    try {
      Response response =
          await DioServices().to().get("/mission", queryParameters: {
        "kind": kind,
        "difficulty": difficulty,
      });

      return List.generate(response.data[RESULT].length,
          (index) => Mission.fromJson(response.data[RESULT][index]));
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///<h2>쓰레기 미션 detail get</h2>
  static Future<MissionDetail?> getMissionDetail(
      {required int missionId}) async {
    try {
      Response response =
          await DioServices().to().get("/mission", queryParameters: {
        "id": missionId,
      });

      return MissionDetail.fromJson(response.data[RESULT]);
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

      return response.data[RESULT]["userPoint"];
    } catch (e) {
      logger.e(e.toString());
      return -1;
    }
  }
}
