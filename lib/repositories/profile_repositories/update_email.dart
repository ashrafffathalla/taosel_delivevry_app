import 'dart:convert';

import 'package:taoel_driver_app/core/constant/apis.dart';
import 'package:taoel_driver_app/data/remote/dio_helper.dart';
import 'package:dio/dio.dart';



class UpdateEmail {
  final DioHelper dioHelper;
  UpdateEmail({required this.dioHelper});

  Future<Response> updateEmail({
    required String email,
  }) async {
    try {
      final Response response = await dioHelper.postData(
          url: AutomationApi.updateEmailUrl,

          data: {
            "email": email,
          },
          needAuth: true
      );
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
