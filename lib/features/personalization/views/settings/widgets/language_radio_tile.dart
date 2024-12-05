import 'package:comprehensive_pharmacy_client_role/common/widgets/buttons/radio_button.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class LanguageRadioTile extends StatefulWidget {
  const LanguageRadioTile({super.key, required this.language, required this.languageName});

  final Language language;
  final String languageName;

  @override
  State<LanguageRadioTile> createState() => _LanguageRadioTileState();
}

class _LanguageRadioTileState extends State<LanguageRadioTile> {
  Language? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.languageName),
        TRadioButton(
          enumValue: widget.language,
          enumGroup: selectedLanguage ?? Language.english,
          onChanged: (Enum? lang) {
            if (lang is Language) {
              setState(() {
                selectedLanguage = lang;
              });
            }
          },
        ),
      ],
    );
  }
}
