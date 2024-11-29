import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_item.dart';
import 'package:flutter/material.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => const OrderItem(),
    );
  }
}
