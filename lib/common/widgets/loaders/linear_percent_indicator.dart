import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/device/device_utility.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TLinearPercentIndicator extends StatefulWidget {
  const TLinearPercentIndicator({super.key});

  @override
  State<TLinearPercentIndicator> createState() => _TLinearPercentIndicatorState();
}

class _TLinearPercentIndicatorState extends State<TLinearPercentIndicator> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _animateProgress();
  }

  void _animateProgress() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _progress = (_progress + 0.1).clamp(0.0, 1.0);
        if (_progress < 1.0) {
          _animateProgress();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return _progress != 1 ? CircularPercentIndicator(
      radius: 10,
      lineWidth: 3,
      percent: _progress,
      backgroundColor: dark ? TColors.dark : TColors.grey,
      progressColor: TColors.primary,
    ) : const SizedBox();
  }
}
