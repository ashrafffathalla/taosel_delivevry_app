class SignUpModel {
  String? message;
  int? code;
  String? token;

  SignUpModel({this.message, this.code, this.token});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['token'] = token;
    return data;
  }
}

class Errors {
  List<String>? fullName;
  List<String>? email;
  List<String>? phone;
  List<String>? password;
  List<String>? licenseId;
  List<String>? licenseImage;

  Errors(
      {this.fullName,
        this.email,
        this.phone,
        this.password,
        this.licenseId,
        this.licenseImage});

  Errors.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'].cast<String>();
    email = json['email'].cast<String>();
    phone = json['phone'].cast<String>();
    password = json['password'].cast<String>();
    licenseId = json['license_id'].cast<String>();
    licenseImage = json['license_image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['license_id'] = this.licenseId;
    data['license_image'] = this.licenseImage;
    return data;
  }
}