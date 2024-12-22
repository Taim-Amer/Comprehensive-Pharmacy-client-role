import 'package:comprehensive_pharmacy_client_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/signup/signup_repo_impl.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_client_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_client_role/utils/storage/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  RxString countryCode = "+963".obs;

  Rx<RequestState> signupApiStatus = RequestState.begin.obs;
  Rx<RequestState> verifyApiStatus = RequestState.begin.obs;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async{
    THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.loading);
    if(!signupFormKey.currentState!.validate()){
      THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.begin);
      return;
    }

    await SignupRepoImpl.instance.signup(
      name: usernameController.text,
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      passwordConfirm: confirmPasswordController.text.trim(),
      lat: 65,
      lng: 64,
      fcmToken: "fcmToken",
    ).then((response) {
      if(response.status == true){
        TCacheHelper.saveData(key: 'phone', value: response.data!.phone);
        Get.offAllNamed(AppRoutes.otp);
        showSnackBar(response.message ?? "", AlertState.success);
        THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.success);
      } else{
        showSnackBar(response.message ?? "", AlertState.error);
        THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.error);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: signupApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> verify() async{
    THelperFunctions.updateApiStatus(target: verifyApiStatus, value: RequestState.loading);
    String? phone = TCacheHelper.getData(key: 'phone');
    await SignupRepoImpl.instance.verifyCode(
      phone: phone!,
      otp: otpController.text.trim(),
    ).then((response) {
      if(response.status == true){
        TCacheHelper.saveData(key: 'token', value: response.token);
        Get.offAllNamed(AppRoutes.order);
        showSnackBar(response.message ?? "", AlertState.success);
        THelperFunctions.updateApiStatus(target: verifyApiStatus, value: RequestState.success);
      }else{
        showSnackBar(response.message ?? "", AlertState.error);
        THelperFunctions.updateApiStatus(target: verifyApiStatus, value: RequestState.error);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: verifyApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> resend() async{
    await SignupRepoImpl.instance.resendOtp(phone: TCacheHelper.getData(key: 'phone')).then((response){
      if(response.status == true){
        showSnackBar(response.message ?? "", AlertState.success);
      }
    });
  }
}