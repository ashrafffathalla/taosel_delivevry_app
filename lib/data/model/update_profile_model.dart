class UpdateAllProfileModel {
  Data? data;
  String? message;
  bool? status;

  UpdateAllProfileModel({this.data, this.message, this.status});

  UpdateAllProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  bool? result;
  Client? client;
  ClientsInfo? clientsInfo;

  Data({this.result, this.client, this.clientsInfo});

  Data.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    clientsInfo = json['clients_info'] != null
        ? new ClientsInfo.fromJson(json['clients_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.clientsInfo != null) {
      data['clients_info'] = this.clientsInfo!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? licenseId;
  String? licenseImage;
  String? countryId;
  String? verificationCode;
  int? verificationStatus;
  Null? photo;

  Client(
      {this.id,
        this.fullName,
        this.email,
        this.phone,
        this.licenseId,
        this.licenseImage,
        this.countryId,
        this.verificationCode,
        this.verificationStatus,
        this.photo});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    licenseId = json['license_id'];
    licenseImage = json['license_image'];
    countryId = json['country_id'];
    verificationCode = json['verification_code'];
    verificationStatus = json['verification_status'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['license_id'] = this.licenseId;
    data['license_image'] = this.licenseImage;
    data['country_id'] = this.countryId;
    data['verification_code'] = this.verificationCode;
    data['verification_status'] = this.verificationStatus;
    data['photo'] = this.photo;
    return data;
  }
}

class ClientsInfo {
  int? id;
  int? clientId;
  int? userId;
  String? address;
  Null? refuseReason;
  String? status;
  String? licenseExpDate;
  String? idExpDate;
  String? birthDate;
  String? createdAt;
  String? updatedAt;
  String? versionNumber;

  ClientsInfo(
      {this.id,
        this.clientId,
        this.userId,
        this.address,
        this.refuseReason,
        this.status,
        this.licenseExpDate,
        this.idExpDate,
        this.birthDate,
        this.createdAt,
        this.updatedAt,
        this.versionNumber});

  ClientsInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    userId = json['user_id'];
    address = json['address'];
    refuseReason = json['refuse_reason'];
    status = json['status'];
    licenseExpDate = json['license_exp_date'];
    idExpDate = json['id_exp_date'];
    birthDate = json['birth_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    versionNumber = json['version_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_id'] = this.clientId;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['refuse_reason'] = this.refuseReason;
    data['status'] = this.status;
    data['license_exp_date'] = this.licenseExpDate;
    data['id_exp_date'] = this.idExpDate;
    data['birth_date'] = this.birthDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['version_number'] = this.versionNumber;
    return data;
  }
}