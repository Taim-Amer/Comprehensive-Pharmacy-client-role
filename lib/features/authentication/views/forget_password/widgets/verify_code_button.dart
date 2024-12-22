import 'package:comprehensive_pharmacy_client_role/features/authentication/controllers/forget_password_controller.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCodeButton extends StatelessWidget {
  const VerifyCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () => ForgetPasswordController.instance.forgetVerify(),
        child: Text(TEnglishTexts.tcontinue),
      ),
    );
  }
}
