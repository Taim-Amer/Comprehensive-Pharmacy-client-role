import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLanguagesContainer extends StatelessWidget {
  const SelectLanguagesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      backgroundColor: const Color(0xFFF3F3F3),
      width: double.infinity,
      height: 150.h,
    );
  }
}
