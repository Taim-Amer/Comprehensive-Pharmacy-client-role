import 'dart:io';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/all_orders_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/cancel_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/create_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/order_status_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/models/show_order_model.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/repositories/order/order_repo.dart';
import 'package:comprehensive_pharmacy_client_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class OrderRepoImpl implements OrderRepo{
  static OrderRepoImpl get instance => Get.find();

  @override
  Future<AllOrdersModel> getMyOrders() {
    final dioHelper = TDioHelper();
    return dioHelper.get(TApiConstants.showMyOrders, queryParameters: {

    }).then((response) => AllOrdersModel.fromJson(response));
  }

  @override
  Future<OrderStatusModel> orderStatus() {
    final dioHelper = TDioHelper();
    return dioHelper.get(TApiConstants.orderStatus, queryParameters: {
      
    }).then((response) => OrderStatusModel.fromJson(response));
  }

  @override
  Future<ShowOrderModel> showOrder() {
    final dioHelper = TDioHelper();
    return dioHelper.get(TApiConstants.showOrder, queryParameters: {
      
    }).then((response) => ShowOrderModel.fromJson(response));
  }

  @override
  Future<CancelOrderModel> cancelOrder() {
    final dioHelper = TDioHelper();
    return dioHelper.patch(TApiConstants.cancel, {
      
    }).then((response) => CancelOrderModel.fromJson(response));
  }

  @override
  Future<CreateOrderModel> createOrder({
    required int pharmacistID,
    String? description,
    required List<File> filesList,
  }) async {
    final dioHelper = TDioHelper();

    // إنشاء FormData مع معلمة فارغة
    final formData = FormData();

    // إضافة الملفات إلى FormData باستخدام await
    for (var file in filesList) {
      final multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last, // اسم الملف
      );
      formData.files.add(MapEntry('files', multipartFile));
    }

    // إضافة البيانات الأخرى إلى FormData
    formData.fields.addAll([
      MapEntry('pharmacistID', pharmacistID.toString()),
      if (description != null) MapEntry('description', description),
    ]);

    // إرسال الطلب باستخدام dioHelper
    try {
      final response = await dioHelper.post(TApiConstants.create, formData);
      return CreateOrderModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }
}