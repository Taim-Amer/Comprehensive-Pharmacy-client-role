import 'package:comprehensive_pharmacy_client_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/forget_password/forget_password_repo_impl.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_client_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_client_role/utils/storage/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final phoneController = TextEditingController();

  Rx<RequestState> forgetPasswordApiStatus = RequestState.begin.obs;

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
    });
  }
}