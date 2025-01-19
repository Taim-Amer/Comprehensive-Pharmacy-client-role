import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_item.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_shimmer.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    var paginationData = OrdersController.instance.myOrdersModel.value.data;
    if (paginationData is PaginationData && paginationData.data != null) {
      var orderList = paginationData.data!;
      return Obx(() => OrdersController.instance.getMyOrdersApiStatus.value == RequestState.loading ? const OrderShimmer() : ListView.builder(
        itemCount: orderList.length,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemBuilder: (context, index) {
          var order = orderList[index];
          int? orderID = int.tryParse(order.id.toString());
          return OrderItem(
            orderID: orderID!,
            pharmacyName: order.pharmacist?.pharmacy?.pharmacyName ?? 'Unknown',
            orderDate: order.createdAt ?? 'Unknown Date',
            orderStatus: status ?? 'Unknown Status',
          );
        },
      ));
    } else {
      return const Center(
        child: Text("No orders available"),
      );
    }
  }
}
