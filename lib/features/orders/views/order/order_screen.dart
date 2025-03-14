import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/tabbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/orders_list.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/empty_order_form.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_floating_action_button.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/order_status_chip.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/orders_header.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Builder(
        builder: (BuildContext context) {
          final tabController = DefaultTabController.of(context);
          return Scaffold(
            floatingActionButton: Obx(() => OrdersController.instance.getMyOrdersApiStatus.value == RequestState.noData ? const SizedBox() : const OrderFloatingActionButton()),
            drawer: const GeneralDrawer(),
            appBar: const TAppBar(
              title: GeneralAppbar(showDrawer: true,),
            ),
            body: Obx(() => OrdersController.instance.getMyOrdersApiStatus.value == RequestState.noData ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: EmptyOrderForm()) : NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) => [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  expandedHeight: 150.h,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w),
                    child: const OrdersHeader(),
                  ),
                  bottom: TTabBar(
                    tabs: List.generate(6, (index) => OrderStatusChip(
                      index: index,
                      tabController: tabController,
                      text: OrdersController.instance.orderStatusChipList[index].tr,
                      status: OrdersController.instance.orderStatusChipList2[index],
                    )),
                  ),
                )
              ],
              body: PageView(
                onPageChanged: (index){
                  tabController.animateTo(index);
                  OrdersController.instance.getMyOrders(status: OrdersController.instance.orderStatusChipList2[index]);
                },
                children: List.generate(OrdersController.instance.emptyForms.length,(index)=> OrdersList(index:index, status:OrdersController.instance.orderStatusChipList2[index],)),
              ),
            )),
          );
        },
      ),
    );
  }
}
