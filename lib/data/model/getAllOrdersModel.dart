class GetAllOrdersModel {
  String? message;
  Data? data;

  GetAllOrdersModel({this.message, this.data});

  GetAllOrdersModel.fromJson(Map<String, dynamic> json) {
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
  List<Orders>? orders;

  Data({this.orders});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  String? orderNumber;
  int? total;
  String? orderStatus;
  String? orderDate;
  int? discount;

  Orders(
      {this.id,
        this.orderNumber,
        this.total,
        this.orderStatus,
        this.orderDate,
        this.discount});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    total = json['total'];
    orderStatus = json['order_status'];
    orderDate = json['order_date'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['total'] = this.total;
    data['order_status'] = this.orderStatus;
    data['order_date'] = this.orderDate;
    data['discount'] = this.discount;
    return data;
  }
}