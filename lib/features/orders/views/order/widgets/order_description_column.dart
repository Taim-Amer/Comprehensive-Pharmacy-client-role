import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDescriptionColumn extends StatelessWidget {
  const OrderDescriptionColumn({super.key});

  Color getContainerColor(){
    Color color = TColors.primary.withOpacity(.2);
    var status = OrdersController.instance.showOrderModel.value.data!.status;
    if(status == "completed"){
      color = TColors.primary.withOpacity(.2);
    } else if(status == "pending"){
      color = const Color(0xFFFAEBB0).withOpacity(.2);
    } else if(status == "canceled"){
      color = const Color(0xFFF5F5F5);
    } else if(status == "rejected"){
      color = const Color(0xFFFFD1D1);
    }
    return color;
  }

  Color getTextColor(){
    Color color = TColors.primary.withOpacity(.2);
    var status = OrdersController.instance.showOrderModel.value.data!.status;
    if(status == "completed"){
      color = TColors.primary;
    } else if(status == "pending"){
      color = const Color(0xFFEEBF00);
    } else if(status == "canceled"){
      color = const Color(0xFF383838);
    } else if(status == "rejected"){
      color = const Color(0xFFFF6B6B);
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    var orderDetails = OrdersController.instance.showOrderModel.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${TranslationKey.kOrderID} #[${orderDetails.data!.id}]", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
            TRoundedContainer(
              backgroundColor: getContainerColor(),
              radius: 100.r,
              height: 30.h,
              padding: const EdgeInsets.all(8),
              child: Center(child: Text(orderDetails.data?.status ?? '', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: getTextColor(), fontSize: 10, fontWeight: FontWeight.w500))),
            )
          ],
        ),
        Text(TFormatter.formatDate(orderDetails.data?.createdAt ?? ""), style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16)),
        TSizes.spaceBtwSections.verticalSpace,
        Text(TranslationKey.kPharmacyName, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
        Text(orderDetails.data?.pharmacist?.pharmacy?.pharmacyName ?? "", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16)),
      ],
    );
  }
}



