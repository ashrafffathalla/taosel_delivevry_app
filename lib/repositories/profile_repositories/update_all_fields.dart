import 'dart:convert';

import 'package:taoel_driver_app/core/constant/apis.dart';
import 'package:taoel_driver_app/data/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class UpdateAllFields {
  final DioHelper dioHelper;
  UpdateAllFields({required this.dioHelper});

  ///Replace
  String textSelect(String str) {
    str = str.replaceAll('email', '');
    str = str.replaceAll('full_name', '');
    str = str.replaceAll('password', '');
    str = str.replaceAll('phone', '');
    str = str.replaceAll('license_id', '');
    str = str.replaceAll('address', '');
    str = str.replaceAll('license_image', '');
    str = str.replaceAll('license_exp_date', '');
    str = str.replaceAll('id_exp_date', '');
    str = str.replaceAll('birth_date', '');
    str = str.replaceAll('version_number', '');
    str = str.replaceAll('{', '');
    str = str.replaceAll('}', '');
    str = str.replaceAll('{}', '');
    str = str.replaceAll('[]', '');
    str = str.replaceAll(']', '');
    str = str.replaceAll('[', '');
    str = str.replaceAll(':', '');
    str = str.replaceAll(',', '\n');
    str = str.replaceAll('.', '');
    str = str.replaceAll('country', '');
    str = str.replaceAll('nationality', '');
    return str;
  }
  Future<Response> updateAllFields({
    required dynamic name,
    required dynamic email,
    required dynamic phone,
    required dynamic image,

  }) async {
    try {
      final Response response = await dioHelper.postData(
          url: AutomationApi.updateAllProfileUrl,
          data: {
            "name": name,
            "email": email,
            "phone": phone,
            "image": image,
          },
          needAuth: true);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error.toString();
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
