import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  const CommonButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 48.h,
        width: 284.w,
        child: OutlinedButton(
          style: customButtonStyle,
          onPressed: onPressed,
          child: Text(text, style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
    );
  }

  ButtonStyle get customButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        foregroundColor: MaterialStateProperty.all<Color>(AppColors.whiteText),
        backgroundColor: MaterialStateProperty.all(AppColors.mainPrimary),
      );
}
