import 'package:comprehensive_pharmacy_client_role/features/orders/models/pharmacies_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/repositories/pharmacy/pharmacy_repo_impl.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class PharmacyController extends GetxController{
  static PharmacyController get instance => Get.find();

  Rx<RequestState> getPharmaciesApiStatus = RequestState.begin.obs;

  final getPharmaciesModel = PharmaciesModel().obs;

  @override
  void onReady() async{
    await getPharmacies();
    super.onReady();
  }

  Future<void> getPharmacies() async {
    THelperFunctions.updateApiStatus(target: getPharmaciesApiStatus, value: RequestState.loading);
    await PharmacyRepoImpl.instance.getPharmacies().then((response){
      if(response.status == true){
        getPharmaciesModel.value = response;
        if(response.pharmacies!.isEmpty){
          THelperFunctions.updateApiStatus(target: getPharmaciesApiStatus, value: RequestState.noData);
        }
        THelperFunctions.updateApiStatus(target: getPharmaciesApiStatus, value: RequestState.success);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getPharmaciesApiStatus, value: RequestState.error);
    });
  }
}