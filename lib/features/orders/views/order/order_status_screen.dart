import 'package:comprehensive_pharmacy_client_role/app.dart';
import 'package:comprehensive_pharmacy_client_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/dashed_divider.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_status_appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/step_row.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TAppBar(title: OrderStatusAppbar()),
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            SvgPicture.asset(TImages.orderStatus),
            TSizes.spaceBtwSections.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepRow(
                  title: TEnglishTexts.processingTitle,
                  description: TEnglishTexts.processingSubTitle,
                  icon: Icons.inventory_2_outlined,
                  isCompleted: true,
                ),
                const DashedDivider(),
                StepRow(
                  title: TEnglishTexts.onWayTitle,
                  description: TEnglishTexts.onWaySubTitle,
                  icon: Icons.local_shipping_outlined,
                  isCompleted: true,
                ),
                const DashedDivider(),
                StepRow(
                  title: TEnglishTexts.deliveredTitle,
                  description: TEnglishTexts.deliveredSubTitle,
                  icon: Icons.check_circle_outline,
                  isCompleted: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
