import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/searching_pharmacy_screen.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderStatusNavbar extends StatelessWidget {
  const OrderStatusNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          onPressed: (){},
          child: Text(TranslationKey.kConfirmDelivery)),
      ),
    );
  }
}
