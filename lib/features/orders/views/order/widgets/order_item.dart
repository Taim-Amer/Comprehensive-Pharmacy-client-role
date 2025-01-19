import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderID, required this.pharmacyName, required this.orderDate, required this.orderStatus});

  final int orderID;
  final String pharmacyName;
  final String orderDate;
  final String orderStatus;

  Color getContainerColor(){
    Color color = TColors.primary.withOpacity(.2);
    if(orderStatus == "completed"){
      color = TColors.primary.withOpacity(.2);
    } else if(orderStatus == "pending"){
      color = const Color(0xFFFAEBB0).withOpacity(.2);
    } else if(orderStatus == "canceled"){
      color = const Color(0xFFF5F5F5);
    } else if(orderStatus == "rejected"){
      color = const Color(0xFFFFD1D1);
    }
    return color;
  }

  Color getTextColor(){
    Color color = TColors.primary.withOpacity(.2);
    if(orderStatus == "completed"){
      color = TColors.primary;
    } else if(orderStatus == "pending"){
      color = const Color(0xFFEEBF00);
    } else if(orderStatus == "canceled"){
      color = const Color(0xFF383838);
    } else if(orderStatus == "rejected"){
      color = const Color(0xFFFF6B6B);
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => OrdersController.instance.showOrder(orderID: orderID).then((response) => Get.toNamed(AppRoutes.orderDetails)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace.w,
          vertical: TSizes.spaceBtwItems.h,
        ),
        child: TRoundedContainer(
          height: 150.h,
          showBorder: true,
          borderColor: const Color(0xFFE0E0E0),
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(17),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${TEnglishTexts.orderID}$orderID", style: Theme.of(context).textTheme.titleLarge),
                  TRoundedContainer(
                    backgroundColor: getContainerColor(),
                    radius: 100.r,
                    height: 30.h,
                    padding: const EdgeInsets.all(8),
                    child: Center(child: Text(orderStatus, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: getTextColor(), fontSize: 10, fontWeight: FontWeight.w500))),
                  )
                ],
              ),
              TSizes.spaceBtwSections.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(TEnglishTexts.pharmacyName, style: Theme.of(context).textTheme.labelMedium),
                      Text(pharmacyName.toString(), style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12)),
                    ],
                  ),
                  TRoundedContainer(
                    backgroundColor: const Color(0xFFE0E0E0),
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(TEnglishTexts.orderDate, style: Theme.of(context).textTheme.labelMedium),
                      Text(orderDate.toString(), style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
