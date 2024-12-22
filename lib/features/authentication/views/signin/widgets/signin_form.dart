import 'package:comprehensive_pharmacy_client_role/features/authentication/controllers/signin_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/views/signin/widgets/phone_country_code.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SigninController.instance.signinFormKey,
      child: Column(
        children: [
          PhoneCountryCode(controller: SigninController(),),
          TextFormField(
            controller: SigninController.instance.passwordController,
            validator: (value) => TValidator.validatePassword(value),
            enableInteractiveSelection: false,
            cursorColor: TColors.primary,
            decoration: InputDecoration(
                hintText: TEnglishTexts.passwordEnter,
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: const Icon(Iconsax.eye_slash)
            ),
          ),
        ],
      ),
    );
  }
}
