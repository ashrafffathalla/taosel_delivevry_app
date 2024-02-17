import 'dart:convert';

import 'package:taoel_driver_app/core/constant/apis.dart';
import 'package:taoel_driver_app/data/model/profile_model.dart';
import 'package:taoel_driver_app/data/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class GetProfileRepository {
  final DioHelper dioHelper;
  GetProfileRepository({required this.dioHelper});

  Future<ProfileListData> getProfileData() async {
    try {
      final Response response = await dioHelper.getData(
          url: AutomationApi.profileUrl, needAuth: true);
      final data = jsonDecode(response.data) as Map<String, dynamic>;
      final ProfileListData profileListData = ProfileListData.fromJson(data);
      return profileListData;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
