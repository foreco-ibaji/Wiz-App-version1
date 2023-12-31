import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'custom_dio_interceptor.dart';

/// <h2> dioService singleton service </h2>
///* DioServices().to()로 사용
class DioServices {
  ///*임시 jwt 토큰
  String tmpToken =
      "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFM1MTIifQ.eyJ1c2VySWQiOjEsImlhdCI6MTY5ODI5MjkyNiwiZXhwIjoxNjk4MzI0NDYyfQ.rMb4KV7Z7tVQWzxHWpbtdgAaLBi3kgAotTbmu1E1mZmbhInzTaJOMAaEXFOe4FG3mVeh4f4ywPp8XbbcTNKWGQ";
  static final DioServices _dioServices = DioServices._internal();
  //dioService singleton
  factory DioServices() => _dioServices;
  //dio 객체
  static Dio _dio = Dio();

  DioServices._internal() {
    BaseOptions _baseOptions = BaseOptions(
      baseUrl: dotenv.env["apiUrl"]!,
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      sendTimeout: const Duration(milliseconds: 10000),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'X-AUTH-TOKEN': tmpToken
      },
    );
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(CustomDioInterceptor());
  }

  Dio to() {
    return _dio;
  }
}
