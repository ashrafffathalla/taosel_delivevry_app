
import 'dart:convert';

import 'package:taoel_driver_app/core/constant/apis.dart';
import 'package:dio/dio.dart';

import 'package:taoel_driver_app/data/local/hiva_helper.dart';
import 'package:taoel_driver_app/data/remote/dio_helper.dart';

class LoginRepositories {
  final DioHelper dioHelper;
  final HiveHelper hiveHelper;

  LoginRepositories({required this.dioHelper, required this.hiveHelper});

  Future<Response> login(
      {required String phone, required String password,required dynamic device_token}) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.loginUrl,
        data: {
          "phone": "+2$phone",
          "password": password,
          "device_token": device_token,
        },
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      String token = data['data']["token"];
      await hiveHelper.putData("token", token);
      print(hiveHelper.getData('token').toString()+"HHHHH");
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      print(error['message']);
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
}