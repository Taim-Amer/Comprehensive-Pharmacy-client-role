import 'package:comprehensive_pharmacy_client_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/controllers/signin_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/views/profile/widgets/profile_appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/views/profile/widgets/profile_form.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/views/profile/widgets/profile_header.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/views/profile/widgets/profile_save_button.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const GeneralDrawer(),
      appBar: const TAppBar(title: ProfileAppbar()),
      body: Padding(
        padding:TSpacingStyle.paddingWithAppBarHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfileHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              const ProfileForm(),
              TSizes.spaceBtwSections.verticalSpace,
              const ProfileSaveButton()
            ],
          ),
        ),
      ),
    );
  }
}
