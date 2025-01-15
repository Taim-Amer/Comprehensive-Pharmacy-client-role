import 'dart:io';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/cancel_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/create_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/order_status_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/show_order_model.dart';

abstract class OrderRepo{
  Future<CreateOrderModel> createOrder({required int pharmacistID, String? description, required List<File> filesList});
  Future<ShowOrderModel> showOrder({required int orderID});
  Future<OrderStatusModel> orderStatus({required int orderID});
  Future<CancelOrderModel> cancelOrder({required int orderID});
  Future<AllOrdersModel> getMyOrders(String? status);
}