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
        pharmacies!.add(new Pharmacies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.pharmacies != null) {
      data['pharmacies'] = this.pharmacies!.map((v) => v.toJson()).toList();
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
  double? distance;
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
        ? new Pharmacist.fromJson(json['pharmacist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['pharmacy_name'] = this.pharmacyName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['distance'] = this.distance;
    if (this.pharmacist != null) {
      data['pharmacist'] = this.pharmacist!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
