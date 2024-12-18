class CreateOrderModel {
  bool? status;
  String? message;
  Order? order;

  CreateOrderModel({this.status, this.message, this.order});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  int? customerId;
  String? pharmacistId;
  String? status;
  String? description;
  String? updatedAt;
  String? createdAt;
  int? id;
  Pharmacist? pharmacist;
  Customer? customer;
  List<Files>? files;

  Order(
      {this.customerId,
        this.pharmacistId,
        this.status,
        this.description,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.pharmacist,
        this.customer,
        this.files});

  Order.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    pharmacistId = json['pharmacist_id'];
    status = json['status'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    pharmacist = json['pharmacist'] != null
        ? Pharmacist.fromJson(json['pharmacist'])
        : null;
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(Files.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['pharmacist_id'] = pharmacistId;
    data['status'] = status;
    data['description'] = description;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    if (pharmacist != null) {
      data['pharmacist'] = pharmacist!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
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
  int? status;
  String? createdAt;
  String? updatedAt;

  Pharmacy(
      {this.id,
        this.userId,
        this.pharmacyName,
        this.status,
        this.createdAt,
        this.updatedAt});

  Pharmacy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pharmacyName = json['pharmacy_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['pharmacy_name'] = pharmacyName;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? phone;
  String? email;

  Customer({this.id, this.name, this.phone, this.email});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}

class Files {
  int? id;
  int? orderId;
  String? filePath;
  String? createdAt;
  String? updatedAt;

  Files({this.id, this.orderId, this.filePath, this.createdAt, this.updatedAt});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    filePath = json['file_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['file_path'] = filePath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
