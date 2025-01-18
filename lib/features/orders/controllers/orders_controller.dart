import 'package:comprehensive_pharmacy_client_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/create_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/order_status_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/show_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/repositories/order/order_repo_impl.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/searching_pharmacy_screen.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/services/file_services.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_client_role/utils/storage/cache_helper.dart';
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
  final createOrderModel = CreateOrderModel().obs;

  final orderDescriptionController = TextEditingController();

  Rx<RequestState> getMyOrdersApiStatus = RequestState.begin.obs;
  Rx<RequestState> showOrderApiStatus = RequestState.begin.obs;
  Rx<RequestState> orderStatusApiStatus = RequestState.begin.obs;
  Rx<RequestState> cancelOrderApiStatus = RequestState.begin.obs;
  Rx<RequestState> createOrderApiStatus = RequestState.begin.obs;

  var selectedChips = <bool>[true, false, false, false].obs;
  var orderStatusChipList = <String>[
    TEnglishTexts.completed,
    TEnglishTexts.pending,
    TEnglishTexts.canceled,
    TEnglishTexts.rejected,
  ].obs;

  @override
  void onReady() async{
    // await getMyOrders();
    getMyOrders(status: 'completed');
    getMyOrders(status: 'pending');
    getMyOrders(status: 'canceled');
    getMyOrders(status: 'rejected');
    super.onReady();
  }

  //['pending', 'Processing', 'on_the_way', 'completed', 'canceled','rejected']

  void toggleChipSelection(int index, bool isSelected) {
    selectedChips[index] = isSelected;
  }

  void updatePageIndicator(index) => currentPageIndex = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  Future<void> getMyOrders({String? status}) async{
    THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.getMyOrders(status).then((response){
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.success);
        myOrdersModel.value = response;
        if (myOrdersModel.value.data is List && (myOrdersModel.value.data as List).isEmpty) {
          THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.noData);
        }
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

  Future<void> createOrder() async{
    THelperFunctions.updateApiStatus(target: createOrderApiStatus, value: RequestState.loading);
    Get.offAll(() => const SearchingPharmacyScreen());
    await OrderRepoImpl.instance.createOrder(
      pharmacistID: TCacheHelper.getData(key: 'pharmacist_id'),
      filesList: TFileServices.selectedFiles.value,
      description: orderDescriptionController.text.toString(),
    ).then((response) {
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: createOrderApiStatus, value: RequestState.success);
        showSnackBar(response.message ?? '', AlertState.success);
        Get.back();
      } else{
        THelperFunctions.updateApiStatus(target: createOrderApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
        Get.back();
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: createOrderApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);

    });
  }
}
