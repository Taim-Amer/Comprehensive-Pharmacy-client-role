import 'package:comprehensive_pharmacy_client_role/app.dart';
import 'package:comprehensive_pharmacy_client_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/widgets/add_notation_textfield.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/widgets/home_header.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/widgets/home_navbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/widgets/upload_files_container.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const HomeNavbar(),
      drawer: const GeneralDrawer(),
      appBar: const TAppBar(
        title: GeneralAppbar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              TSizes.spaceBtwSections.verticalSpace,
              const UploadFilesContainer(),
              TSizes.spaceBtwItems.verticalSpace,
              const AddNotationTextfield(),
            ],
          ),
        ),
      ),
    );
  }
}
