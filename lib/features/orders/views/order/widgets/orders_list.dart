import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_item.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_shimmer.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    var paginationData = OrdersController.instance.myOrdersModel.value.data;
    if (paginationData is PaginationData && paginationData.data != null) {
      var orderList = paginationData.data!;
      return Obx(() => OrdersController.instance.getMyOrdersApiStatus.value == RequestState.loading ? const OrderShimmer() : RefreshIndicator(
        color: TColors.primary,
        backgroundColor: dark ? TColors.dark : TColors.light,
        onRefresh: () async => await OrdersController.instance.getMyOrders(status: status),
        child: ListView.builder(
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
        ),
      ));
    } else {
      return Center(
        child: RefreshIndicator(
          color: TColors.primary,
          backgroundColor: dark ? TColors.dark : TColors.light,
          onRefresh: () async => await OrdersController.instance.getMyOrders(status: status),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(TImages.emptyOrders),
              TSizes.sm.verticalSpace,
              const Text("No orders available"),
            ],
          ),
        ),
      );
    }
  }
}
