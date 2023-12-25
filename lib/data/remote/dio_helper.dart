import 'package:taoel_driver_app/core/constant/lang_code.dart';
import 'package:dio/dio.dart';

import '../local/hiva_helper.dart';

class DioHelper {
  final Dio dio;
  final HiveHelper hiveHelper;

  DioHelper({
    required this.dio,
    required this.hiveHelper,
  });

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    required bool needAuth,
  }) {
    if (needAuth) {
      final String? token = hiveHelper.getData("token");
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    return dio.get(
      url,
      queryParameters: query,
      options: Options(
        responseType: ResponseType.plain,
        headers: {
          "X-Locale": langCode,
          "Accept":"application/json",
          "Content-Type":"application/json",
          "X-Time-Zone":"Africa/Cairo"
        },
      ),
    );
  }

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
    required bool needAuth,
  }) {
    if (needAuth) {
      final String? token = HiveHelper().getData("token");
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    return dio.post(
      url,
      data: data,
      options: Options(
        responseType: ResponseType.plain,
        headers: {
          "Config-lang": langCode,
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
  }
  Future<Response> postOTPData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
    required bool needAuth,
  }) {
    if (needAuth) {
      final String? token = HiveHelper().getData("tokenRegister");
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    return dio.post(
      url,
      data: data,
      options: Options(
        responseType: ResponseType.plain,
        headers: {
          "Config-lang": langCode,
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
  }

  Future<Response> againPostOTPData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
    required bool needAuth,
  }) {
    if (needAuth) {
      final String? token = HiveHelper().getData('sendAgainToken');
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    return dio.post(
      url,
      data: data,
      options: Options(
        responseType: ResponseType.plain,
        headers: {
          "Config-lang": langCode,
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    required bool needAuth,
  }) {
    if (needAuth) {
      final String? token = hiveHelper.getData("token");
      dio.options.headers['authorization'] = 'Token $token';
    }

    return dio.put(
      url,
      data: data,
      queryParameters: query,
      options: Options(
        responseType: ResponseType.plain,
        headers: {
          "Config-lang": langCode,
        },
      ),
    );
  }

  Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    required bool needAuth,
  }) {
    if (needAuth) {
      final String? token = hiveHelper.getData("token");
      dio.options.headers['authorization'] = 'Token $token';
    }

    return dio.patch(
      url,
      data: data,
      queryParameters: query,
      options: Options(
        responseType: ResponseType.plain,
        headers: {
          "Config-lang": langCode,
        },
      ),
    );
  }
}
