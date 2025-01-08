import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_item.dart';
import 'package:flutter/material.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({super.key});

  @override
  Widget build(BuildContext context) {
    var orderItem = OrdersController.instance.myOrdersModel.value.data?.data;
    return ListView.builder(
      itemCount: orderItem?.length ?? 0,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      // itemBuilder: (context, index) => OrderItem(
      //   orderID: orderItem[index].,
      //   pharmacyName: pharmacyName,
      //   orderDate: orderDate,
      //   orderStatus: orderStatus,
      // ),
      itemBuilder: (context, index) => const SizedBox(),
    );
  }
}
