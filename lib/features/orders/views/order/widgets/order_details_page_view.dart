import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/images/rounded_image.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDetailsPageView extends StatelessWidget {
  const OrderDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: 280.h,
      child: PageView.builder(
        itemCount: OrdersController.instance.showOrderModel.value.data?.files?.length ?? 0,
        scrollDirection: Axis.horizontal,
        controller: OrdersController.instance.pageController,
        itemBuilder: (context, index) => Transform.scale(
          scale: 1.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TRoundedContainer(
              width: 382.w,
              height: 265.h,
              backgroundColor: dark ? TColors.darkContainer : TColors.borderPrimary,
              child: TRoundedImage(imageUrl: "https://pharmacy.technoplus.dev/storage/${OrdersController.instance.showOrderModel.value.data?.files?[index].filePath}", isNetworkImage: true),
            ),
          ),
        ),
      ),
    );
  }
}
