class PharmaciesModel {
  bool? status;
  String? message;
  List<Pharmacies>? pharmacies;

  PharmaciesModel({this.status, this.message, this.pharmacies});

  PharmaciesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['pharmacies'] != null) {
      pharmacies = <Pharmacies>[];
      json['pharmacies'].forEach((v) {
        pharmacies!.add(Pharmacies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (pharmacies != null) {
      data['pharmacies'] = pharmacies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pharmacies {
  int? id;
  int? userId;
  String? pharmacyName;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? distance;
  Pharmacist? pharmacist;

  Pharmacies(
      {this.id,
        this.userId,
        this.pharmacyName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.distance,
        this.pharmacist});

  Pharmacies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pharmacyName = json['pharmacy_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distance = json['distance'];
    pharmacist = json['pharmacist'] != null
        ? Pharmacist.fromJson(json['pharmacist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['pharmacy_name'] = pharmacyName;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['distance'] = distance;
    if (pharmacist != null) {
      data['pharmacist'] = pharmacist!.toJson();
    }
    return data;
  }
}

class Pharmacist {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? lat;
  String? lng;

  Pharmacist({this.id, this.name, this.email, this.phone, this.lat, this.lng});

  Pharmacist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}