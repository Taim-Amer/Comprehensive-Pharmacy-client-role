import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          enableInteractiveSelection: false,
          decoration: InputDecoration(
              hintText: TEnglishTexts.passwordEnter,
              prefixIcon: const Icon(Iconsax.lock),
              suffixIcon: const Icon(Iconsax.eye_slash)
          ),
        ),
        TSizes.spaceBtwInputField.verticalSpace,
        TextFormField(
          enableInteractiveSelection: false,
          decoration: InputDecoration(
              hintText: TEnglishTexts.passwordEnter,
              prefixIcon: const Icon(Iconsax.lock),
              suffixIcon: const Icon(Iconsax.eye_slash)
          ),
        ),
      ],
    );
  }
}
