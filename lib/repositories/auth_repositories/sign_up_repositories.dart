import 'dart:convert';

// import 'package:taoel_driver_app/data/model/country_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:taoel_driver_app/data/local/hiva_helper.dart';
import 'package:taoel_driver_app/data/model/signup_model.dart';
import 'package:taoel_driver_app/data/remote/dio_helper.dart';

import '../../core/constant/apis.dart';
import '../../core/constant/lang_code.dart';
import 'package:http/http.dart' as http;
class SignUpRepositories {
  final DioHelper dioHelper;
  final HiveHelper hiveHelper;
  String? token;
  String textSelect(String str) {
    str = str.replaceAll('email', '');
    str = str.replaceAll('full_name', '');
    str = str.replaceAll('password', '');
    str = str.replaceAll('phone', '');
    str = str.replaceAll('license_id', '');
    str = str.replaceAll('license_image', '');
    str = str.replaceAll('{', '');
    str = str.replaceAll('}', '');
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

  SignUpRepositories({required this.dioHelper, required this.hiveHelper});

//get Country
//   Future<CountryListModel> getCountry() async {
//     try {
//       final Response response = await dioHelper.getData(
//           url: AutomationApi.countriesUrl, needAuth: false);
//
//       final data = json.decode(response.data) as Map<String, dynamic>;
//       final CountryListModel countryListModel = CountryListModel.fromMap(data);
//
//       return countryListModel;
//     } on DioError catch (dioError) {
//       var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
//
//       throw error['message'];
//     } catch (error) {
//       throw '..Oops $error';
//     }
//   }

//Sign Up
  Future<Response> signUp(
      {required String email,
      required String name,
      required String phone,
      required String password,
      required String password_confirmation,
      }) async {
    try {
      FormData formData = FormData.fromMap({
        "user_name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "phone": "+2$phone",
      });

      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.registerUrl,
        data: formData,
      );
        var data = jsonDecode(response.data) as Map<String, dynamic>;
      token = data['data']["token"];
      await HiveHelper().putData('token', token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw textSelect(error['data'].toString());
    } catch (error) {
      throw '..Oops $error';
    }
  }

//Check Otp
  Future<Response> otp({
    required String otp,
  }) async {
    try {
      final Response response = await dioHelper.postOTPData(
        needAuth: true,
        url: AutomationApi.checkOtpRegisterUrl,
        data: {
          "code": otp,
        },
      );
      // var data = jsonDecode(response.data) as Map<String, dynamic>;
      // await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;

      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
//Check Change pass Otp
  ///SEND CODE AGAIN
  Future<Response> Againotp({
    required String otp,
  }) async {
    try {
      final Response response = await dioHelper.againPostOTPData(
        needAuth: true,
        url: AutomationApi.checkOtpRegisterUrl,
        data: {
          "otp": otp,
        },
      );
      // var data = jsonDecode(response.data) as Map<String, dynamic>;
      // await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
  ///
  Future<Response> otpPass({
    required String otp,
  }) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: true,
        url: AutomationApi.checkOtpRegisterUrl,
        data: {
          "otp": otp,
        },
      );
      // var data = jsonDecode(response.data) as Map<String, dynamic>;
      // await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
  Future<Response> verifyPhone({
    required String otp,
  }) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: true,
        url: AutomationApi.verifyPhone,
        data: {
          "code": otp,
        },
      );
      // var data = jsonDecode(response.data) as Map<String, dynamic>;
      // await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
  //change Phone
  Future<Response> changePhone({
    required String phone,
  }) async {
    try {
      final Response response = await dioHelper.postOTPData(
        needAuth: true,
        url: AutomationApi.changePhoneUrl,
        data: {
          "phone": phone,
        },
      );
      // var data = jsonDecode(response.data) as Map<String, dynamic>;

      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }


  Future<Response> sendDocuments(
      {required String email,
        required String name,
        required String phone,
        required String password,
        required String password_confirmation,
      }) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "phone": "+2$phone",
      });

      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.registerUrl,
        data: formData,
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      token = data['data']["token"];
      await HiveHelper().putData('token', token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw textSelect(error['data'].toString());
    } catch (error) {
      throw '..Oops $error';
    }
  }

  Future<void> uploadDocuments(
      {required String image,
        required String driving_image,
        required String driving_license,
        required String car_image,
        required String type_vehicle}) async {
    try {
      var item = http.MultipartRequest(
          "POST", Uri.parse('${AutomationApi.baseUrl}/profile',
      ),);
      if (image != "") {
        item.files.add(
          await http.MultipartFile.fromPath(
            "logo",
            image,
          ),
        );
      }
      if (driving_image != "") {
        item.files.add(
          await http.MultipartFile.fromPath(
            "driving_image",
            driving_image,
          ),
        );
      }
      if (driving_license != "") {
        item.files.add(
          await http.MultipartFile.fromPath(
            "driving_license",
            driving_license,
          ),
        );
      }
      if (car_image != "") {
        item.files.add(
          await http.MultipartFile.fromPath(
            "car_image",
            car_image,
          ),
        );
      }
      item.fields['type_vehicle'] = type_vehicle;
      item.fields['_method'] = 'PUT';
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('token');
      item.headers.addAll({
        "Accept": "application/json",
        'Content-type': 'application/json',
        'Authorization': "Bearer $token",
         "X-Locale": langCode == '' ? "en" : langCode
      });
      var response = await item.send();
      // print(image.toString()+"Hhhhhhhh1");
      // print(driving_image.toString()+"Hhhhhhhh2");
      // print(driving_license.toString()+"Hhhhhhhh3");
      // print(car_image.toString()+"Hhhhhhhh4");
      // print(type_vehicle.toString()+"Hhhhhhhh5");
      // if (response.statusCode == 200) {
      // } else {
      //   throw Exception();
      // }
    } catch (e) {
      throw Exception(e);
    }
  }
}

