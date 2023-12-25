class ShowVendorModel {
  Data? data;

  ShowVendorModel({this.data});

  ShowVendorModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? lang;
  String? phone;
  String? mobile;
  String? deliveryCharge;
  String? deliveryTime;
  bool? isDelivery;
  int? rating;
  String? description;
  String? address;
  String? createdAt;
  String? updatedAt;
  List<Media>? media;
  List<Categories>? categories;

  Data(
      {this.id,
        this.name,
        this.lang,
        this.phone,
        this.mobile,
        this.deliveryCharge,
        this.deliveryTime,
        this.isDelivery,
        this.rating,
        this.description,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.media,
        this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lang = json['lang'];
    phone = json['phone'];
    mobile = json['mobile'];
    deliveryCharge = json['delivery_charge'];
    deliveryTime = json['delivery_time'];
    isDelivery = json['is_delivery'];
    rating = json['rating'];
    description = json['description'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lang'] = this.lang;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['delivery_charge'] = this.deliveryCharge;
    data['delivery_time'] = this.deliveryTime;
    data['is_delivery'] = this.isDelivery;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? id;
  String? name;
  String? description;
  String? path;
  String? type;
  int? order;
  bool? isMain;
  int? size;
  String? createdAt;
  String? updatedAt;

  Media(
      {this.id,
        this.name,
        this.description,
        this.path,
        this.type,
        this.order,
        this.isMain,
        this.size,
        this.createdAt,
        this.updatedAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    path = json['path'];
    type = json['type'];
    order = json['order'];
    isMain = json['is_main'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['path'] = this.path;
    data['type'] = this.type;
    data['order'] = this.order;
    data['is_main'] = this.isMain;
    data['size'] = this.size;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Categories {
  String? name;
  String? langId;
  List<Products>? products;

  Categories({this.name, this.langId, this.products});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    langId = json['lang_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lang_id'] = this.langId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  String? lang;
  int? price;
  int? discountPrice;
  bool? featured;
  String? yourChoice;
  String? currency;
  List<Media>? media;
  List<Addition>? addition;


  Products(
      {this.id,
        this.name,
        this.description,
        this.lang,
        this.price,
        this.discountPrice,
        this.featured,
        this.yourChoice,
        this.currency,
        this.media,
        this.addition});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    lang = json['lang'];
    price = json['price'];
    discountPrice = json['discount_price'];
    featured = json['featured'];
    yourChoice = json['your_choice'];
    currency = json['currency'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add( Media.fromJson(v));
      });
    } if (json['addition'] != null) {
      addition = <Addition>[];
      json['addition'].forEach((v) {
        addition!.add(new Addition.fromJson(v));
      });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['lang'] = lang;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['featured'] = featured;
    data['your_choice'] = yourChoice;
    data['currency'] = currency;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Addition {
  int? id;
  String? name;
  int? price;
  bool? isActive;

  Addition({this.id, this.name, this.price, this.isActive});

  Addition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['is_active'] = this.isActive;
    return data;
  }
}