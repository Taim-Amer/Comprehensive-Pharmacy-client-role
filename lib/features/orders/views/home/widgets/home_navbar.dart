import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeNavbar extends StatelessWidget {
  const HomeNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: Obx(() {
          bool isEnabled = OrdersController.instance.isCreateButtonEnabled.value;
          return OrdersController.instance.createOrderApiStatus.value == RequestState.loading ? const SizedBox() : ElevatedButton(
            onPressed: isEnabled ? () => OrdersController.instance.createOrder() : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isEnabled
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.5),
              side: BorderSide(
                color: isEnabled
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              disabledBackgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            child: Text(
              TranslationKey.kCreateYourOrder,
              style: TextStyle(
                color: isEnabled ? Colors.white : Colors.white.withOpacity(0.7),
              ),
            ),
          );
        }),
      ),
    );
  }
}
