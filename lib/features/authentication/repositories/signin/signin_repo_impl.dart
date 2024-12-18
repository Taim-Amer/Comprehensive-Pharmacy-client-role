import 'package:comprehensive_pharmacy_client_role/features/authentication/models/signin_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/repositories/signin/signin_repo.dart';
import 'package:comprehensive_pharmacy_client_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/api_constants.dart';
import 'package:get/get.dart';

class SigninRepoImpl implements SigninRepo{
  static SigninRepoImpl get instance => Get.find();

  @override
  Future<SigninModel> signin({required String phone, required String password, required String fcmToken}) {
    final dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.signin, {
      'phone' : phone,
      'password' : password,
      'fcmToken' : fcmToken,
    }).then((response) => SigninModel.fromJson(response));
  }
}