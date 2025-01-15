class AllOrdersModel {
  bool? status;
  String? message;
  dynamic data;

  AllOrdersModel({this.status, this.message, this.data});

  AllOrdersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] is List) {
      data = [];
    } else if (json['data'] is Map) {
      data = PaginationData.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      if (this.data is PaginationData) {
        data['data'] = (this.data as PaginationData).toJson();
      } else {
        data['data'] = this.data;
      }
    }
    return data;
  }
}

class PaginationData {
  int? currentPage;
  List<OrderDetails>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  PaginationData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  PaginationData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <OrderDetails>[];
      json['data'].forEach((v) {
        data!.add(OrderDetails.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class OrderDetails {
  int? id;
  int? customerId;
  int? pharmacistId;
  int? driverId;
  String? status;
  String? description;
  String? price;
  String? createdAt;
  String? updatedAt;
  Pharmacist? pharmacist;
  Customer? customer;

  OrderDetails({
    this.id,
    this.customerId,
    this.pharmacistId,
    this.driverId,
    this.status,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.pharmacist,
    this.customer,
  });

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    pharmacistId = json['pharmacist_id'];
    driverId = json['driver_id'];
    status = json['status'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pharmacist = json['pharmacist'] != null
        ? Pharmacist.fromJson(json['pharmacist'])
        : null;
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['pharmacist_id'] = pharmacistId;
    data['driver_id'] = driverId;
    data['status'] = status;
    data['description'] = description;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pharmacist != null) {
      data['pharmacist'] = pharmacist!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}


class Pharmacist {
  int? id;
  String? name;
  String? phone;
  String? email;
  Pharmacy? pharmacy;

  Pharmacist({this.id, this.name, this.phone, this.email, this.pharmacy});

  Pharmacist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    pharmacy = json['pharmacy'] != null
        ? Pharmacy.fromJson(json['pharmacy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    if (pharmacy != null) {
      data['pharmacy'] = pharmacy!.toJson();
    }
    return data;
  }
}

class Pharmacy {
  int? id;
  int? userId;
  String? pharmacyName;

  Pharmacy({this.id, this.userId, this.pharmacyName});

  Pharmacy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pharmacyName = json['pharmacy_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['pharmacy_name'] = pharmacyName;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? phone;

  Customer({this.id, this.name, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
