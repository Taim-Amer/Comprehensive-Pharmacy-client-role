import 'package:comprehensive_pharmacy_client_role/features/authentication/controllers/signup_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/views/signin/widgets/phone_country_code.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignupController.instance.signupFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: SignupController.instance.usernameController,
            validator: (value) => TValidator.validateEmptyText(" ${TEnglishTexts.userName}", value),
            enableInteractiveSelection: false,
            cursorColor: TColors.primary,
            decoration: InputDecoration(
                hintText: TEnglishTexts.userName,
                prefixIcon: const Icon(Iconsax.user),
            ),
          ),
          TSizes.spaceBtwInputField.verticalSpace,
          PhoneCountryCode(controller: SignupController()),
          // TSizes.spaceBtwInputField.verticalSpace,
          TextFormField(
            controller: SignupController.instance.emailController,
            validator: (value) => TValidator.validateEmail(value),
            enableInteractiveSelection: false,
            keyboardType: TextInputType.emailAddress,
            cursorColor: TColors.primary,
            decoration: InputDecoration(
                hintText: TEnglishTexts.emailAddress,
                prefixIcon: const Icon(Iconsax.message),
            ),
          ),
          TSizes.spaceBtwInputField.verticalSpace,
          TextFormField(
            controller: SignupController.instance.passwordController,
            validator: (value) => TValidator.validatePassword(value),
            enableInteractiveSelection: false,
            cursorColor: TColors.primary,
            decoration: InputDecoration(
                hintText: TEnglishTexts.password,
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: const Icon(Iconsax.eye_slash)
            ),
          ),
          TSizes.spaceBtwInputField.verticalSpace,
          TextFormField(
            controller: SignupController.instance.confirmPasswordController,
            validator: (value) => TValidator.validatePassword(value),
            enableInteractiveSelection: false,
            cursorColor: TColors.primary,
            decoration: InputDecoration(
                hintText: TEnglishTexts.confirmPassword,
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: const Icon(Iconsax.eye_slash)
            ),
          ),
          TSizes.spaceBtwInputField.verticalSpace,
          TextFormField(
            enableInteractiveSelection: false,
            cursorColor: TColors.primary,
            decoration: InputDecoration(
                hintText: TEnglishTexts.location,
                prefixIcon: const Icon(Iconsax.location),
                suffixIcon: const Icon(Icons.keyboard_arrow_right_outlined, size: 22,)
            ),
          ),
        ],
      ),
    );
  }
}
