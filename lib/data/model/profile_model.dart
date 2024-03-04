class ProfileListData {
  Data? data;

  ProfileListData({this.data});

  ProfileListData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? phone;
  Null? address;
  Null? lat;
  Null? lng;
  int? wallet;
  int? typeVehicle;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.userName,
        this.email,
        this.phone,
        this.address,
        this.lat,
        this.lng,
        this.wallet,
        this.typeVehicle});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    wallet = json['wallet'];
    typeVehicle = json['type_vehicle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['wallet'] = this.wallet;
    data['type_vehicle'] = this.typeVehicle;
    return data;
  }
}