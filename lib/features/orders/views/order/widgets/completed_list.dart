import 'package:comprehensive_pharmacy_client_role/features/authentication/views/forget_password/password_confirmed_screen.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_item.dart';
import 'package:flutter/material.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({super.key});

  @override
  Widget build(BuildContext context) {
    var paginationData = OrdersController.instance.myOrdersModel.value.data;

    if (paginationData is PaginationData && paginationData.data != null) {
      var orderList = paginationData.data!;

      return ListView.builder(
        itemCount: orderList.length,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemBuilder: (context, index) {
          var order = orderList[index];
          return OrderItem(
            orderID: order.id.toString(),
            pharmacyName: order.pharmacist?.pharmacy?.pharmacyName ?? 'Unknown',
            orderDate: order.createdAt ?? 'Unknown Date',
            orderStatus: order.status ?? 'Unknown Status',
          );
        },
      );
    } else {
      return const Center(
        child: Text("No orders available"),
      );
    }
  }
}
