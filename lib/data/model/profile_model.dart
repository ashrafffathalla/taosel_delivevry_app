class ProfileListData {
  String? message;
  Data? data;

  ProfileListData({this.message, this.data});

  ProfileListData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Null? firstName;
  Null? lastName;
  String? userName;
  String? email;
  String? password;
  String? phone;
  Null? address;
  Null? lat;
  Null? lng;
  bool? status;
  Null? image;
  String? apiToken;
  Null? code;
  String? createdAt;
  String? updatedAt;
  Null? resetCode;
  Null? typeVehicle;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.userName,
        this.email,
        this.password,
        this.phone,
        this.address,
        this.lat,
        this.lng,
        this.status,
        this.image,
        this.apiToken,
        this.code,
        this.createdAt,
        this.updatedAt,
        this.resetCode,
        this.typeVehicle});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    status = json['status'];
    image = json['image'];
    apiToken = json['api_token'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    resetCode = json['reset_code'];
    typeVehicle = json['type_vehicle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['status'] = this.status;
    data['image'] = this.image;
    data['api_token'] = this.apiToken;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['reset_code'] = this.resetCode;
    data['type_vehicle'] = this.typeVehicle;
    return data;
  }
}