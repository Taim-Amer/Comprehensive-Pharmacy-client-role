import 'package:comprehensive_pharmacy_client_role/common/widgets/loaders/shimmer_loader.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PharmaciesShimmer extends StatelessWidget {
  const PharmaciesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: ListView.separated(
        itemCount: 12,
        itemBuilder: (context, index) => ShimmerLoader(width: double.infinity, height: 70.h),
        separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
      ),
    );
  }
}
