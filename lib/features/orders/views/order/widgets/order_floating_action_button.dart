import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderFloatingActionButton extends StatelessWidget {
  const OrderFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.to(const HomeScreen()),
      child: const Icon(Icons.add, size: 30,),
    );
  }
}
