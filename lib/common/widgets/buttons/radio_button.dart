// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class TRadioButton extends StatelessWidget {
  TRadioButton({super.key, required this.enumValue, required this.enumGroup, required this.onChanged});

  Enum enumValue;
  Enum? enumGroup;
  ValueChanged<Enum?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio<Enum>(
      value: enumValue,
      groupValue: enumGroup,
      onChanged: onChanged
    );
  }
}
