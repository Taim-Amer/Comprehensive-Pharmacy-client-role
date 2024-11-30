import 'package:comprehensive_pharmacy_client_role/app.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/dotted_container.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/widgets/home_header.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/widgets/home_navbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const HomeNavbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: const GeneralDrawer(),
      appBar: const TAppBar(
        title: GeneralAppbar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              TDottedContainer(
                width: double.infinity,
                height: 195.h,
                borderColor: TColors.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(TImages.uploadIcon),
                    TSizes.md.verticalSpace,
                    Text(TEnglishTexts.uploadFile, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
                    TSizes.sm.verticalSpace,
                    Text(TEnglishTexts.supportedFiles, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)),
                    TSizes.md.verticalSpace,
                    SizedBox(
                      child: ElevatedButton(
                          onPressed: onPressed,
                          child: child,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
