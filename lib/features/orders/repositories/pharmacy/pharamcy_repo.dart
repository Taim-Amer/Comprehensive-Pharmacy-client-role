import 'package:comprehensive_pharmacy_client_role/features/orders/models/pharmacies_model.dart';

abstract class PharmacyRepo{
  Future<PharmaciesModel> getPharmacies();
}