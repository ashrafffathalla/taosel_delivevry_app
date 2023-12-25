class NotificationModel {
  List<Data>? data;

  NotificationModel({this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

}

class Data {
  String? id;
  String? type;
  DataView? dataView;
  Null? readAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.type,
        this.dataView,
        this.readAt,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    dataView = json['data'] != null ?  DataView.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class DataView {
  String? title;
  String? message;
  String? createdAt;

  DataView({this.title, this.message, this.createdAt});

  DataView.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    return data;
  }
}