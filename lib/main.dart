import 'package:comprehensive_pharmacy_client_role/app.dart';
import 'package:comprehensive_pharmacy_client_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async{

  Get.testMode = true;

  WidgetsFlutterBinding.ensureInitialized();

  await TCacheHelper.init();

  runApp(const ClientApp());
}