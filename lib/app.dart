import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
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
        // initialRoute: initialRoute,
        // getPages: AppRoutes.routes,
        // translations: TAppTranslations(),
        // locale: Locale(language ?? 'en'),
        // fallbackLocale: const Locale('en'),
        // initialBinding: GeneralBindings(),
        home: const Scaffold(
          body: Center(child: Text("Taim")),
        ),
      ),
    );
  }
}