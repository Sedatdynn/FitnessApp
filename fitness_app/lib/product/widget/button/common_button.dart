import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Button for using all registration and home pages
class CommonButton extends StatelessWidget {
  const CommonButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.color = AppColors.mainPrimary,
  });
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 48.h,
        width: 284.w,
        child: OutlinedButton(
          style: customButtonStyle,
          onPressed: onPressed,
          child: Text(text, style: context.textTheme.titleSmall).tr(),
        ),
      ),
    );
  }

  ButtonStyle get customButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(AppColors.whiteText),
        backgroundColor: MaterialStateProperty.all(color),
      );
}
