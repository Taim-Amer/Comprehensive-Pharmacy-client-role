import 'package:comprehensive_pharmacy_client_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/order_status_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/show_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/repositories/order/order_repo_impl.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find<OrdersController>();

  final pageController = PageController(viewportFraction: .8);
  Rx<int> currentPageIndex = 0.obs;
  var isCreateButtonEnabled = false.obs;

  final myOrdersModel = AllOrdersModel().obs;
  final showOrderModel = ShowOrderModel().obs;
  final orderStatusModel = OrderStatusModel().obs;

  Rx<RequestState> getMyOrdersApiStatus = RequestState.begin.obs;
  Rx<RequestState> showOrderApiStatus = RequestState.begin.obs;
  Rx<RequestState> orderStatusApiStatus = RequestState.begin.obs;
  Rx<RequestState> cancelOrderApiStatus = RequestState.begin.obs;

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

  void updatePageIndicator(index) => currentPageIndex = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  Future<void> getMyOrders({required String status}) async{
    THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.getMyOrders(status: status).then((response){
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.success);
        myOrdersModel.value = response;
      } else{
        THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.error);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> showOrder({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: showOrderApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.showOrder(orderID: orderID).then((response){
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: showOrderApiStatus, value: RequestState.success);
        showOrderModel.value = response;
      } else{
        THelperFunctions.updateApiStatus(target: showOrderApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: showOrderApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> orderStatus({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: orderStatusApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.orderStatus(orderID: orderID).then((response){
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: orderStatusApiStatus, value: RequestState.success);
        orderStatusModel.value = response;
      } else{
        THelperFunctions.updateApiStatus(target: orderStatusApiStatus, value: RequestState.error);
        showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: orderStatusApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> cancelOrder({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: cancelOrderApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.cancelOrder(orderID: orderID).then((response){
      if(response.status = true){
        THelperFunctions.updateApiStatus(target: cancelOrderApiStatus, value: RequestState.success);
      } else{
        THelperFunctions.updateApiStatus(target: cancelOrderApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: cancelOrderApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }
}
