import 'package:comprehensive_pharmacy_client_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchingPharmacyScreen extends StatelessWidget {
  const SearchingPharmacyScreen({super.key});

  // final int orderID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.staggeredDotsWave(
              color: TColors.primary,
              size: 80,
            ),
            TSizes.spaceBtwSections.verticalSpace,
            Text(TranslationKey.kSearchingTitle, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
            TSizes.spaceBtwItems.verticalSpace,
            Text(TranslationKey.kSearchingSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
            TSizes.spaceBtwSections.verticalSpace,
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: Text(TranslationKey.kTcontinue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
