import 'package:comprehensive_pharmacy_client_role/features/orders/models/pharmacies_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/repositories/pharmacy/pharamcy_repo.dart';
import 'package:comprehensive_pharmacy_client_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_client_role/utils/storage/cache_helper.dart';
import 'package:get/get.dart';

class PharmacyRepoImpl implements PharmacyRepo{
  static PharmacyRepoImpl get instance => Get.find();

  final String? token = TCacheHelper.getData(key: 'token');

  @override
  Future<PharmaciesModel> getPharmacies() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getPharmacies, token: token).then((response) => PharmaciesModel.fromJson(response));
  }
}