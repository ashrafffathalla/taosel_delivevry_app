import 'dart:convert';

import 'package:taoel_driver_app/core/constant/apis.dart';
import 'package:taoel_driver_app/data/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class UpdateName {
  final DioHelper dioHelper;
  UpdateName({required this.dioHelper});

  Future<Response> updateName({
    required String name,
  }) async {
    try {
      final Response response = await dioHelper.postData(
          url: AutomationApi.updateNameUrl,
          data: {
            "full_name": name,
          },
          needAuth: true);
      print(response.data);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
