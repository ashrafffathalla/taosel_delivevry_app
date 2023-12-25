import 'dart:convert';
import 'dart:math';

import 'package:taoel_driver_app/core/constant/apis.dart';
import 'package:dio/dio.dart';

import 'package:taoel_driver_app/data/local/hiva_helper.dart';
import 'package:taoel_driver_app/data/model/allVendorCategoryModel.dart';
import 'package:taoel_driver_app/data/model/showVendor_model.dart';
import 'package:taoel_driver_app/data/remote/dio_helper.dart';

import '../../data/model/allCategoryCategories.dart';
import '../../data/model/allVendors_model.dart';
import '../../data/model/cart_order_store_model.dart';

class HomeRepositories {
  final DioHelper dioHelper;
  HomeRepositories({required this.dioHelper,});

  Future<AllCategoryVendorsModel> getAllVendorsCategoriesRepositories()async{
    try {
       Response response = await dioHelper.getData(
          url: AutomationApi.getAlCategorylVendors, needAuth: true
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final AllCategoryVendorsModel  vendorCategoryModel = AllCategoryVendorsModel.fromJson(data);
      return vendorCategoryModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
  ///------------------ALl Vendors
  Future<AllVendorCategoryModel> allVendorCategoryRepositories(id)async{
    try {
      print('JJj');
      Response response = await dioHelper.getData(
          url: 'https://taosel.com/api/vendor-categories/$id', needAuth: true
      );
      print('JJ2');
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final AllVendorCategoryModel  allVendorCategoryModel = AllVendorCategoryModel.fromJson(data);
      return allVendorCategoryModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
  Future<AllVendorsModel> allVendorsRepositories()async{
    try {
      Response response = await dioHelper.getData(
          url: AutomationApi.getAllVendors, needAuth: true
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final AllVendorsModel  allVendorsModel = AllVendorsModel.fromJson(data);
      return allVendorsModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
  ///---------------------------
 Future<ShowVendorModel> showVendorRepositories(id)async{
    try {
      Response response = await dioHelper.getData(
          url: 'https://taosel.com/api/vendors/$id', needAuth: true
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final ShowVendorModel  showVendorModel = ShowVendorModel.fromJson(data);
      return showVendorModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
  Future<Response> addAddition(
      {required String product_id, required String quantity, List? additions,}) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.addAddition,
        data: {
          "product_id": product_id,
          "quantity": quantity,
          "additions": additions,
        },
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      // await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      print(error['message']);
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
  ///----------Show Order Store
///
  Future<CartOrderStoreModel> showOrderCart(
      {required String paymentMethod, required String addressId, required String notes,required dynamic total,required String discount,}) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.showOrderCart,
        data: {
          "payment_method": paymentMethod,
          "address_id": addressId,
          "notes": notes,
          "total": total,
          "discount": discount,
        },
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final CartOrderStoreModel  cartOrderStoreModel = CartOrderStoreModel.fromJson(data);
      return cartOrderStoreModel;
      // await hiveHelper.putData("token", token);
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      print(error['message']);
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }

  Future<Response> cancelBooking({required  orderId, }) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: true,
        url: AutomationApi.cancelOrder,
        data: {
          "order_id": orderId,
        },
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      // await hiveHelper.putData("token", token);
      print(data['message']+"5555");
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }

  Future<Response> addNewAddress(
      {required String address, required double lat,required double lon,}) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.sendLocation,
        data: {
          "address": address,
          "lat": lat,
          "lon": lon,
        },
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      return response;
      // await hiveHelper.putData("token", token);
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      print(error['message']);
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }




}