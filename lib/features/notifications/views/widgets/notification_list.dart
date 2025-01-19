import 'package:comprehensive_pharmacy_client_role/app.dart';
import 'package:comprehensive_pharmacy_client_role/features/notifications/views/widgets/notification_item.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 12,
      itemBuilder: (context, index) => const NotificationItem(),
      separatorBuilder: (context, _) => TSizes.spaceBtwItems.verticalSpace,
    );
  }
}
