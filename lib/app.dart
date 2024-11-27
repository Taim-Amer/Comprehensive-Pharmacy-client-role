import 'package:comprehensive_pharmacy_client_role/dependencies/forget_password_binding.dart';
import 'package:comprehensive_pharmacy_client_role/dependencies/otp_binding.dart';
import 'package:comprehensive_pharmacy_client_role/dependencies/signin_binding.dart';
import 'package:comprehensive_pharmacy_client_role/dependencies/signup_binding.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/views/forget_password/verify_code_screen.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/views/signin/signin_screen.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_client_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_client_role/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClientApp extends StatelessWidget {
  const ClientApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialRoute: AppRoutes.setPassword,
        getPages: AppRoutes.routes,
        // translations: TAppTranslations(),
        // locale: const Locale('en'),
        // fallbackLocale: const Locale('en'),
        initialBinding: ForgetPasswordBinding(),
        // home: const VerifyCodeScreen(),
        // home: const SigninScreen(),
      ),
    );
  }
}