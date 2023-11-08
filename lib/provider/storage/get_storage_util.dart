import 'dart:async';

import 'package:get_storage/get_storage.dart';


enum StorageKey {
  JWT_TOKEN,
}


class GetStorageUtil {
  ///* singleton 내부 저장소
  static final storage = GetStorage();

  //GetStorage에서 key에 해당하는 value를 가져옴
  ///* return : String
  static Future<String?> getToken(StorageKey key) async {
    final String? token = storage.read(key.name);
    if (token == null) {
      return null;
    }
    return token;
  }

  ///* return : String
  static Future<void> setToken(StorageKey key, String token) async {
    await storage.write(key.name,token);
  }
  ///GetStorage에서 key에 해당하는 value를 설정해줌


  ///GetStorage에서 key에 해당하는 value를 제거
  ///* [key] : [StorageKey] enum
  static Future<void> delAllSearch(StorageKey key) async =>
      await storage.remove(key.name);
}
