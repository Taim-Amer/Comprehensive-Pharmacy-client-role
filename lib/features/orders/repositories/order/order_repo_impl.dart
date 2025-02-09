import 'dart:io';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/cancel_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/create_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/order_status_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/show_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/repositories/order/order_repo.dart';
import 'package:comprehensive_pharmacy_client_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_client_role/utils/logging/logger.dart';
import 'package:comprehensive_pharmacy_client_role/utils/storage/cache_helper.dart';
import 'package:get/get.dart' as ins;
import 'package:dio/dio.dart';

class OrderRepoImpl implements OrderRepo{
  static OrderRepoImpl get instance => ins.Get.find<OrderRepoImpl>();

  String? token = TCacheHelper.getData(key: 'token');

  @override
  Future<AllOrdersModel> getMyOrders(String? status) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.showMyOrders,
      token: token,
      queryParameters: status != null ? {'status' : status} : {}
    ).then((response) => AllOrdersModel.fromJson(response));
  }

  @override
  Future<OrderStatusModel> orderStatus({required int orderID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.orderStatus,
      queryParameters: {'order_id': orderID},
      token: token,
    ).then((response) => OrderStatusModel.fromJson(response));
  }

  @override
  Future<ShowOrderModel> showOrder({required int orderID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(
      TApiConstants.showOrder,
      {'order_id': orderID},
      token: token,
    ).then((response) => ShowOrderModel.fromJson(response));
  }

  @override
  Future<CancelOrderModel> cancelOrder({required int orderID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(
      TApiConstants.cancel,
      {'order_id': orderID},
      token: token,
    ).then((response) => CancelOrderModel.fromJson(response));
  }

  @override
  Future<CreateOrderModel> createOrder({
    required int pharmacistID,
    String? description,
    required List<File> filesList,
  }) async {
    final dioHelper = TDioHelper();
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('pharmacist_id', pharmacistID.toString()),
      if (description != null) MapEntry('description', description),
    ]);

    for (int i = 0; i < filesList.length; i++) {
      final multipartFile = await MultipartFile.fromFile(
        filesList[i].path,
        filename: filesList[i].path.split('/').last,
      );
      formData.files.add(MapEntry('files[$i]', multipartFile));
    }

    return await dioHelper.post(TApiConstants.create, formData, token: token,
    ).then((response) => CreateOrderModel.fromJson(response)).catchError((error){
      TLoggerHelper.info(error.toString());
    });
  }

}