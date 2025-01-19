import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/features/notifications/views/widgets/notification_item.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: GeneralAppbar(showDrawer: false,)),
      drawer: GeneralDrawer(),
      body: NotificationItem(),
    );
  }
}
