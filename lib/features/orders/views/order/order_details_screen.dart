import 'package:comprehensive_pharmacy_client_role/app.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/device/device_utility.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    var c = Get.put(OrdersController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(TEnglishTexts.orderDetails, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 280.h,
            child: PageView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              controller: OrdersController.instance.pageController,
              itemBuilder: (context, index) => Transform.scale(
                scale: 1.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TRoundedContainer(
                    width: 382.w,
                    height: 265.h,
                    backgroundColor: TColors.borderPrimary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(TImages.camera),
                        TSizes.md.verticalSpace,
                        Text(TEnglishTexts.prescriptionPhoto, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          TSizes.spaceBtwItems.verticalSpace,
          SmoothPageIndicator(
            count: 3,
            controller: OrdersController.instance.pageController,
            onDotClicked: OrdersController.instance.dotNavigationClick,
            effect: ExpandingDotsEffect(
                activeDotColor: TColors.primary,
                dotColor: TColors.borderPrimary,
                dotWidth: 12.w,
                dotHeight: 7.h,
            ),
          ),
          TSizes.spaceBtwSections.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(TEnglishTexts.orderID, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                    TRoundedContainer(
                      backgroundColor: const Color(0xFFD9F5F0),
                      radius: 100.r,
                      height: 30.h,
                      padding: const EdgeInsets.all(8),
                      child: Center(child: Text(TEnglishTexts.completed, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.primary, fontSize: 10, fontWeight: FontWeight.w500))),
                    )
                  ],
                ),
                Text("Tue , 10 Sept 12:20 PM", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16)),
                TSizes.spaceBtwSections.verticalSpace,
                Text(TEnglishTexts.pharmacyName, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w500)),
                Text("Ultramedica", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 16)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
