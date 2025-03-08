import 'package:comprehensive_pharmacy_client_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/forms/empty_form.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/create_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/order_status_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/show_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/repositories/order/order_repo_impl.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/home/searching_pharmacy_screen.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/services/file_services.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_client_role/utils/logging/logger.dart';
import 'package:comprehensive_pharmacy_client_role/utils/router/app_router.dart';
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
    TranslationKey.kCompleted,
    TranslationKey.kPending,
    TranslationKey.kCanceled,
    TranslationKey.kRejected,
    TranslationKey.kProcessing,
    TranslationKey.kOnTheWay,
  ].obs;

  var orderStatusChipList2 = <String>[
    "completed",
    "pending",
    "canceled",
    "rejected",
    "processing",
    "on the way",
  ].obs;

  @override
  void onReady() async{
    await getMyOrders();
    getMyOrders(status: "completed");
    getMyOrders(status: "pending");
    getMyOrders(status: "canceled");
    getMyOrders(status: "rejected");
    getMyOrders(status: "processing");
    getMyOrders(status: "on the way");
    super.onReady();
  }

  List<TEmptyForm> emptyForms = [
    TEmptyForm(
      image: TImages.finishedOrderEmpty,
      title: TranslationKey.kFinishedOrdersEmptyTitle,
      subTitle: TranslationKey.kFinishedOrdersEmptySubTitle,
    ),
    TEmptyForm(
      image: TImages.newOrderEmpty,
      title: TranslationKey.kNewOrdersEmptyTitle,
      subTitle: TranslationKey.kNewOrdersEmptySubTitle,
    ),
    TEmptyForm(
      image: TImages.rejectedOrderEmpty,
      title: TranslationKey.kCanceledOrdersEmptyTitle,
      subTitle: TranslationKey.kCanceledOrdersEmptySubTitle,
    ),
    TEmptyForm(
      image: TImages.rejectedOrderEmpty,
      title: TranslationKey.kRejectedOrdersEmptyTitle,
      subTitle: TranslationKey.kRejectedOrdersEmptySubTitle,
    ),
    TEmptyForm(
      image: TImages.processing,
      title: TranslationKey.kProcessingTitle,
      subTitle: TranslationKey.kProcessingSubTitle,
    ),
    TEmptyForm(
      image: TImages.newOrderEmpty,
      title: TranslationKey.kOnTheWayOrdersEmptyTitle.tr,
      subTitle: TranslationKey.kOnTheWayOrdersEmptySubTitle.tr,
    ),
  ];

  Widget emptyFormTest(int index) => emptyForms[index];



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
        myOrdersModel.value = response;
        if (myOrdersModel.value.data is List && (myOrdersModel.value.data as List).isEmpty) {
          THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.noData);
        }
        THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.success);
      } else{
        THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
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
      TLoggerHelper.error(error.toString());
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
        showSnackBar(TranslationKey.kErrorMessage, AlertState.warning);
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
        showSnackBar(response.message ?? '', AlertState.success);
        THelperFunctions.updateApiStatus(target: cancelOrderApiStatus, value: RequestState.success);
        // Get.offAllNamed(AppRoutes.order);
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
    Get.to(() => const SearchingPharmacyScreen());
    await OrderRepoImpl.instance.createOrder(
      pharmacistID: TCacheHelper.getData(key: 'pharmacist_id'),
      filesList: TFileServices.selectedFiles.value,
      description: orderDescriptionController.text.toString(),
    ).then((response) {
      if(response.status == true){
        showSnackBar(response.message ?? '', AlertState.success);
        THelperFunctions.updateApiStatus(target: createOrderApiStatus, value: RequestState.success);
        Get.offNamed(AppRoutes.home);
      } else{
        THelperFunctions.updateApiStatus(target: createOrderApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
        Get.offAllNamed(AppRoutes.home);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: createOrderApiStatus, value: RequestState.error);
      TLoggerHelper.warning(error.toString());
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
      Get.offAllNamed(AppRoutes.home);
    });
  }


}
