import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/app/app_constant.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';

class CustomNumberPicker extends StatelessWidget {
  final int value;
  final int minValue;
  final int maxValue;
  final void Function(int) onChanged;
  const CustomNumberPicker(
      {super.key,
      required this.value,
      required this.minValue,
      required this.maxValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      selectedTextStyle: context.textTheme.titleLarge?.copyWith(color: AppColors.mainPrimary),
      textStyle: context.textTheme.titleSmall,
      decoration: const BoxDecoration(border: ResponsiveConstants.customPickerBorder),
      value: value,
      minValue: minValue,
      maxValue: maxValue,
      onChanged: onChanged,
    );
  }
}
