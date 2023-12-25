// import 'dart:convert';
// import 'package:taosel_user_app/data/local/hiva_helper.dart';
// import '../../core/constant/apis.dart';
// import '../../core/constant/lang_code.dart';
// import 'package:http/http.dart' as http;
//
//
// class DeleteAccountRepositories {
//     Future<DeleteProfileModel> deleteProfile() async {
//     try {
//       final token = await HiveHelper().getData('token');
//       var response = await http.post(Uri.parse(AutomationApi.baseUrl + '/delete_account'), headers: {
//         "Accept": "application/json",
//         "Authorization": "Bearer $token",
//         'Accept-Language': langCode == '' ? 'en' : langCode
//       });
//       print(response.body);
//       var data = json.decode(response.body) as Map<String, dynamic>;
//       if (response.statusCode == 200) {
//         return DeleteProfileModel.fromJson(data);
//       } else if (response.statusCode == 500) {
//         throw Exception("Server Error");
//       } else if (response.statusCode == 401) {
//         throw Exception("Not Authenticated");
//       } else if (response.statusCode == 422) {
//         throw Exception("Data is not valid");
//       } else if (response.statusCode == 404) {
//         throw Exception("Data Not Found");
//       } else if (response.statusCode == 429) {
//         throw Exception("Too many requests");
//       } else if (response.statusCode == 403) {
//         throw Exception("Your Request Is Not Allowed");
//       } else {
//         throw Exception();
//       }
//     } catch (error) {
//       throw Exception(error);
//     }
//   }
// }