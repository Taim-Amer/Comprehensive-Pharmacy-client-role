import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(TEnglishTexts.signinQuastion),
        TextButton(
          onPressed: () => Get.offAllNamed(AppRoutes.signin),
          child: Text(TEnglishTexts.login),
        )
      ],
    );
  }
}
