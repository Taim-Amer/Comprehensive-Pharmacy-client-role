import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/pharmacy_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/repositories/pharmacy/pharmacy_repo_impl.dart';
import 'package:get/get.dart';

class PharmacyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<PharmacyController>(PharmacyController());
    Get.put<PharmacyRepoImpl>(PharmacyRepoImpl());
  }
}