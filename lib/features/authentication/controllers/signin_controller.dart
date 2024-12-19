  import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/signin/signin_repo_impl.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SigninController extends GetxController{
  static SigninController get instance => Get.find();

  RxString countryCode = "+963".obs;

  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  Rx<RequestState> signinApiStatus = RequestState.begin.obs;

  Future<void> signin() async{
    THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.loading);
    await SigninRepoImpl.instance.signin(
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      fcmToken: "fcmToken",
    ).then((response) {
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: signinApiStatus, value: RequestState.success);
        
      }
    });
  }
}