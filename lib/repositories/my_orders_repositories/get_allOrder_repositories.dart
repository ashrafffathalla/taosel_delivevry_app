import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taoel_driver_app/data/model/getAllOrdersModel.dart';

import '../../core/constant/apis.dart';
import '../../data/remote/dio_helper.dart';

class GetAllOrdersRepositories {
  final DioHelper dioHelper;
  GetAllOrdersRepositories({required this.dioHelper,});

  Future<GetAllOrdersModel> getAlOrders()async{
    try {
      Response response = await dioHelper.getData(
          url: AutomationApi.getAllOrder, needAuth: true
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final GetAllOrdersModel  getAllOrders = GetAllOrdersModel.fromJson(data);
      return getAllOrders;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
}