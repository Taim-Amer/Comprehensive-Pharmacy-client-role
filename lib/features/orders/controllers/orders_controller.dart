import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find();

  var selectedChips = <bool>[true, false, false, false].obs;
  var orderStatusChipList = <String>[
    TEnglishTexts.completed,
    TEnglishTexts.pending,
    TEnglishTexts.canceled,
    TEnglishTexts.rejected,
  ].obs;

  void toggleChipSelection(int index, bool isSelected) {
    selectedChips[index] = isSelected;
  }
}
