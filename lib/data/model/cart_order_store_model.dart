class CartOrderStoreModel {
  String? message;
  Data? data;

  CartOrderStoreModel({message, data});

  CartOrderStoreModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  Order? order;

  Data({order});

  Data.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ?  Order.fromJson(json['order']) : null;
  }

}

class Order {
  int? id;
  String? orderNumber;
  int? total;
  String? orderStatus;
  String? orderDate;
  int? discount;
  String? notes;
  Address? address;
  Client? client;
  List<Products>? products;
  List<Additions>? additions;

  Order(
      {id,
        orderNumber,
        total,
        orderStatus,
        orderDate,
        discount,
        notes,
        address,
        client,
        products,
        additions});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    total = json['total'];
    orderStatus = json['order_status'];
    orderDate = json['order_date'];
    discount = json['discount'];
    notes = json['notes'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['additions'] != null) {
      additions = <Additions>[];
      json['additions'].forEach((v) {
        additions!.add(new Additions.fromJson(v));
      });
    }
  }

}

class Address {
  int? id;
  String? address;
  dynamic lat;
  dynamic lon;

  Address({id, address, lat, lon});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['address'] = address;
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? showNotification;
  List<Null>? media;
  String? createdAt;
  String? updatedAt;

  Client(
      {id,
        name,
        email,
        phone,
        showNotification,
        media,
        createdAt,
        updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    showNotification = json['show_notification'];
    // if (json['media'] != null) {
    //   media = <Null>[];
    //   json['media'].forEach((v) {
    //     media!.add(new Null.fromJson(v));
    //   });
    // }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['show_notification'] = showNotification;
    // if (media != null) {
    //   data['media'] = media!.map((v) => v.toJson()).toList();
    // }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Products {
  int? id;
  int? quantity;
  int? price;
  Product? product;

  Products({id, quantity, price, product});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['quantity'] = quantity;
    data['price'] = price;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? lang;
  int? price;
  int? discountPrice;
  bool? featured;
  String? yourChoice;
  String? currency;

  Product(
      {id,
        name,
        description,
        lang,
        price,
        discountPrice,
        featured,
        yourChoice,
        currency});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    lang = json['lang'];
    price = json['price'];
    discountPrice = json['discount_price'];
    featured = json['featured'];
    yourChoice = json['your_choice'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['lang'] = lang;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['featured'] = featured;
    data['your_choice'] = yourChoice;
    data['currency'] = currency;
    return data;
  }
}

class Additions {
  int? id;
  int? quantity;
  int? price;
  AdditionsData? additionsData;

  Additions({id, quantity, price, additionsData});

  Additions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    additionsData = json['additions'] != null
        ? AdditionsData.fromJson(json['additions'])
        : null;
  }
}

class AdditionsData {
  int? id;
  String? name;
  int? price;
  bool? isActive;

  AdditionsData({id, name, price, isActive});

  AdditionsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    isActive = json['is_active'];
  }

}