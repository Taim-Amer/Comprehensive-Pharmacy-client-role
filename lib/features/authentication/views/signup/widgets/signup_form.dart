import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
          decoration: InputDecoration(
              hintText: TEnglishTexts.passwordEnter,
              prefixIcon: const Icon(Iconsax.lock),
              suffixIcon: const Icon(Iconsax.eye_slash)
          ),
        ),
        TSizes.spaceBtwInputField.verticalSpace,
        const PhoneCountryCode(),
        TSizes.spaceBtwInputField.verticalSpace,
        TextFormField(
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
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
