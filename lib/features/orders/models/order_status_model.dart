class OrderStatusModel {
  bool? status;
  String? orderStatus;

  OrderStatusModel({this.status, this.orderStatus});

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderStatus = json['orderStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['orderStatus'] = orderStatus;
    return data;
  }
}
