import 'package:comprehensive_pharmacy_client_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/controllers/settings_controller.dart';
import 'package:comprehensive_pharmacy_client_role/features/personalization/views/settings/widgets/language_radio_tile.dart';
import 'package:comprehensive_pharmacy_client_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_client_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguageChangingContainer extends StatelessWidget {
  LanguageChangingContainer({super.key});

  final ValueNotifier<Language?> selectedLanguageNotifier = ValueNotifier<Language?>(Language.english);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      backgroundColor: dark ? TColors.dark : TColors.lightGrey,
      width: 394.w,
      height: 150.h,
      radius: 12.r,
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace.w, vertical: 31.h),
      child: Column(
        children: [
          Expanded(
            child: LanguageRadioTile(
              language: Language.english,
              languageName: TranslationKey.kEnglish,
              valueNotifier: selectedLanguageNotifier,
              onChanged: (value) {
                SettingsController.instance.setSelectedRadio(1);
              },
            ),
          ),
          40.verticalSpace,
          Expanded(
            child: LanguageRadioTile(
              language: Language.arabic,
              languageName: TranslationKey.kArabic,
              valueNotifier: selectedLanguageNotifier,
              onChanged: (value) {
                SettingsController.instance.setSelectedRadio(2);
              },
            ),
          ),
        ],
      ),
    );
  }
}



// value: 1,
//               groupValue: SettingsController.instance.selectedLanguage.value ?? 2,
//               onChanged: (value) => SettingsController.instance.setSelectedRadio(1),



