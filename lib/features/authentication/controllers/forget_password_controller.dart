import 'package:comprehensive_pharmacy_client_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/forget_password/forget_password_repo_impl.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_client_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_client_role/utils/storage/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  RxString countryCode = "+963".obs;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordConfirmController = TextEditingController();

  Rx<RequestState> forgetPasswordApiStatus = RequestState.begin.obs;
  Rx<RequestState> forgetVerifyApiStatus = RequestState.begin.obs;
  Rx<RequestState> newPasswordApiStatus = RequestState.begin.obs;

  Future<void> forgetPassword() async{
    THelperFunctions.updateApiStatus(target: forgetPasswordApiStatus, value: RequestState.loading);
    await ForgetPasswordRepoImpl.instance.forgetPassword(phone: phoneController.text.trim()).then((response){
      if(response.status == true){
        TCacheHelper.saveData(key: 'phone', value: phoneController.text.trim());
        THelperFunctions.updateApiStatus(target: forgetPasswordApiStatus, value: RequestState.success);
        Get.toNamed(AppRoutes.verifyCode);
      }else{
        showSnackBar(response.message ?? '', AlertState.error);
        THelperFunctions.updateApiStatus(target: forgetPasswordApiStatus, value: RequestState.error);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: forgetPasswordApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> forgetVerify() async{
    THelperFunctions.updateApiStatus(target: forgetVerifyApiStatus, value: RequestState.loading);
    await ForgetPasswordRepoImpl.instance.passwordVerify(
      phone: TCacheHelper.getData(key: 'phone'),
      otp: otpController.text.trim(),
    ).then((response) {
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: forgetVerifyApiStatus, value: RequestState.success);
        Get.toNamed(AppRoutes.setPassword);
      } else{
        THelperFunctions.updateApiStatus(target: forgetVerifyApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.error);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: forgetVerifyApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> newPassword() async{
    THelperFunctions.updateApiStatus(target: newPasswordApiStatus, value: RequestState.loading);
    await ForgetPasswordRepoImpl.instance.newPassword(
      phone: TCacheHelper.getData(key: 'phone'), 
      password: newPasswordController.text.trim(),
      passwordConfirm: newPasswordController.text.trim(),
    ).then((response) {
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: newPasswordApiStatus, value: RequestState.success);
        Get.offAllNamed(AppRoutes.passwordConfirm);
      } else{
        THelperFunctions.updateApiStatus(target: newPasswordApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.error);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: newPasswordApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }
}