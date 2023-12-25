import 'dart:convert';

import 'package:taoel_driver_app/core/constant/apis.dart';
import 'package:taoel_driver_app/data/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class UpdatePhone {
  final DioHelper dioHelper;
  UpdatePhone({required this.dioHelper});

  Future<Response> updatePhone({
    required String phone,
  }) async {
    try {
      final Response response = await dioHelper.postData(
          url: AutomationApi.updatePhoneUrl,
          data: {
            "phone": phone,
          },
          needAuth: true);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['data']["phone"];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
