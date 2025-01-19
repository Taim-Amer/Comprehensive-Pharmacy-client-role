import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_description_column.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_details_navbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_details_page_view.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/page_view_indicator.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const OrderDetailsNavbar(),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(TranslationKey.kOrderDetails, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),),
      ),
      body: Column(
        children: [
          const OrderDetailsPageView(),
          TSizes.spaceBtwItems.verticalSpace,
          const PageViewIndicator(),
          TSizes.spaceBtwSections.verticalSpace,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: OrderDescriptionColumn(),
          )
        ],
      ),
    );
  }
}
