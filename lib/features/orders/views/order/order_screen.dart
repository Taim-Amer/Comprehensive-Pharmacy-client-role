import 'package:comprehensive_pharmacy_client_role/app.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/orders_empty_body.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/orders_header.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GeneralDrawer(),
      appBar: const TAppBar(
        title: GeneralAppbar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OrdersHeader(),
            OrdersEmptyBody(),
            SizedBox(height: TSizes.spaceBtwSections * 4)
          ],
        ),
      ),
    );
  }
}
