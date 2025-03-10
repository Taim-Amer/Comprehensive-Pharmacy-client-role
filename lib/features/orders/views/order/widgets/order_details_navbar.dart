import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailsNavbar extends StatelessWidget {
  const OrderDetailsNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => OrdersController.instance.showOrderModel.value.data!.status == (TranslationKey.kPending) || OrdersController.instance.showOrderModel.value.data!.status == (TranslationKey.kOnTheWay) || OrdersController.instance.showOrderModel.value.data!.status == (TranslationKey.kProcessing) ? Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: OrdersController.instance.cancelOrderApiStatus.value == RequestState.success ? const SizedBox() : SizedBox(
        height: 50.h,
        child: ElevatedButton(
          onPressed: () => OrdersController.instance.cancelOrder(orderID: OrdersController.instance.showOrderModel.value.data!.id!), style: ElevatedButton.styleFrom(
          backgroundColor: TColors.redColor,
          side: const BorderSide(color: TColors.redColor),
          ), child: Text(TranslationKey.kCancelOrder),
        ),
      ),
    ) : const SizedBox());
  }
}
