class AllCategoryVendorsModel {
  List<Data> data;
  Links links;
  Meta meta;

  AllCategoryVendorsModel({required this.data, required this.links,required  this.meta});

  factory AllCategoryVendorsModel.fromJson(Map<String, dynamic> json) {
    return AllCategoryVendorsModel(
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      links: Links.fromJson(json['links']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Data {
  String name;
  String langId;
  int id;

  Data({required this.name, required this.langId,required this.id});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      name: json['name'],
      langId: json['lang_id'],
      id: json['id'],
    );
  }
}

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({required this.first, required this.last, required this.prev,required  this.next});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required  this.from,
    required  this.lastPage,
    required  this.links,
    required  this.path,
    required    this.perPage,
    required  this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links: List<Link>.from(json['links'].map((x) => Link.fromJson(x))),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class Link {
  dynamic url;
  String label;
  bool active;

  Link({required this.url,required  this.label,required  this.active});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}

