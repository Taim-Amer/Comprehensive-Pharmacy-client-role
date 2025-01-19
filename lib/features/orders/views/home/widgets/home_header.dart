import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TranslationKey.kHomeTitle, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)),
        TSizes.sm.verticalSpace,
        Text(TranslationKey.kHomeSubTitle, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
