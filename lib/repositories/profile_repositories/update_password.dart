import 'dart:convert';

import 'package:taoel_driver_app/core/constant/apis.dart';
import 'package:taoel_driver_app/data/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class UpdatePassword {
  final DioHelper dioHelper;
  UpdatePassword({required this.dioHelper});

  Future<Response> updatePassword({
    required String password,
    required String new_password_confirmation,
  }) async {
    try {
      final Response response = await dioHelper.postData(
          url: AutomationApi.changePasswordUrl,
          data: {
            "new_password": password,
            "new_password_confirmation": new_password_confirmation,
          },
          needAuth: true);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
