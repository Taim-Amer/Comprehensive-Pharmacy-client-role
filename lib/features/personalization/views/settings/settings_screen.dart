import 'package:comprehensive_pharmacy_client_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/views/settings/widgets/settings_appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: SettingsAppbar()),
    );
  }
}
