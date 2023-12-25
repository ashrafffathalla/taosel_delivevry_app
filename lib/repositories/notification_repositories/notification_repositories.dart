
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taoel_driver_app/data/model/notification_model.dart';

import '../../core/constant/apis.dart';
import '../../data/remote/dio_helper.dart';

class GelAllNotificationRepository {
  final DioHelper dioHelper;
  GelAllNotificationRepository({required this.dioHelper});

  Future<NotificationModel> getAllNotification() async {
    try {
      final Response response = await dioHelper.getData(
          url: AutomationApi.getNotification, needAuth: true);
      final data = jsonDecode(response.data) as Map<String, dynamic>;
      final NotificationModel notificationModel = NotificationModel.fromJson(data);
      return notificationModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}