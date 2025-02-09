import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/buttons/back_icon.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/pharmacy_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/pharmacies_shimmer.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/pharmacy_item.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PharmaciesScreen extends StatelessWidget {
  const PharmaciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: BackIcon()),
      body: Obx(() => PharmacyController.instance.getPharmaciesApiStatus.value == RequestState.loading ? const PharmaciesShimmer() : Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: ListView.separated(
          itemCount: 1,
          // itemCount: PharmacyController.instance.getPharmaciesModel.value.pharmacies?.length ?? 0,
          itemBuilder: (context, index) => PharmacyItem(
            pharmacyStatus: PharmacyController.instance.getPharmaciesModel.value.pharmacies?[index].status ?? 0,
            pharmacyName: PharmacyController.instance.getPharmaciesModel.value.pharmacies?[index].pharmacyName ?? '',
            distance: PharmacyController.instance.getPharmaciesModel.value.pharmacies?[index].distance ?? 0,
            pharmacistID: PharmacyController.instance.getPharmaciesModel.value.pharmacies?[index].pharmacist?.id ?? 0,
          ),
          separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
        ),
      )),
    );
  }
}
