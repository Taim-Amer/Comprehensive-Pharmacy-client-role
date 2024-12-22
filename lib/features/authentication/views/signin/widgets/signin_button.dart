import 'package:comprehensive_pharmacy_client_role/features/authentication/controllers/signin_controller.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () => SigninController.instance.signin(),
        child: Text(TEnglishTexts.login),
      ),
    );
  }
}
