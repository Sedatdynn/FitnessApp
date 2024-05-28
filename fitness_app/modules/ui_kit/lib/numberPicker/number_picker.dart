import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

/// Number picker Widget for using age/height/weight pages with different values
class CustomNumberPicker extends StatelessWidget {
  const CustomNumberPicker({
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    super.key,
  });
  final int value;
  final int minValue;
  final int maxValue;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return NumberPicker(
      selectedTextStyle: textTheme.titleLarge?.copyWith(color: const Color(0xffdabcf6)),
      textStyle: textTheme.titleSmall,
      decoration: BoxDecoration(border: customPickerBorder),
      value: value,
      minValue: minValue,
      maxValue: maxValue,
      onChanged: onChanged,
    );
  }

  static const BorderSide _customPickerBorderSide = BorderSide(
    color: Color(0xFFC4FB6D),
    width: 3,
  );
  final Border customPickerBorder =
      const Border(top: _customPickerBorderSide, bottom: _customPickerBorderSide);
}
