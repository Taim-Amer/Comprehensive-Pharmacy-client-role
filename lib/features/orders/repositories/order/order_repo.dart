import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/cancel_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/order_status_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/show_order_model.dart';

abstract class OrderRepo{
  Future<ShowOrderModel> showOrder();
  Future<AllOrdersModel> getMyOrders();
  Future<OrderStatusModel> orderStatus();
  Future<CancelOrderModel> cancelOrder();
}