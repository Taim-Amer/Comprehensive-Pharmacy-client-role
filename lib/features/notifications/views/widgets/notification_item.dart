import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      height: 165.h,
      radius: 12.r,
      width: double.infinity,
      backgroundColor: dark ? TColors.dark : const Color(0xFFF7F7F7),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TEnglishTexts.orderID, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
                  Text("Order status updated", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xFFACACAC))),

                ],
              ),
              Text("12:22 AM", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 12, color: const Color(0xFFACACAC))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(TImages.onTheWay),
                  TSizes.xs.horizontalSpace,
                  Text("On the way", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 14, color: TColors.primary)),
                ],
              ),
              Text("Your order is being delivered by our team", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xFFACACAC))),
            ],
          )
        ],
      ),
    );
  }
}
