import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/pharmacy_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/pharmacy_item.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmaciesScreen extends StatelessWidget {
  const PharmaciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: BackIcon()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: ListView.separated(
            itemCount: PharmacyController.instance.getPharmaciesModel.value.pharmacies?.length ?? 0,
            itemBuilder: (context, index) => PharmacyItem(
              pharmacyStatus: PharmacyController.instance.getPharmaciesModel.value.pharmacies?[index].status ?? 0,
              pharmacyName: PharmacyController.instance.getPharmaciesModel.value.pharmacies?[index].pharmacyName ?? '',
              distance: PharmacyController.instance.getPharmaciesModel.value.pharmacies?[index].distance ?? 0,
              pharmacistID: PharmacyController.instance.getPharmaciesModel.value.pharmacies?[index].pharmacist?.id ?? 0,
            ),
            separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
          ),
      ),
    );
  }
}
