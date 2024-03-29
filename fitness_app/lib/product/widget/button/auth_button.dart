import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../feature/views_shelf.dart';
import '../../theme/colors.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final Color? color;
  final Widget icon;
  final Color? textColor;
  final VoidCallback onPressed;
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 342.w,
      child: OutlinedButton.icon(
        icon: icon,
        onPressed: onPressed,
        label: Center(
          child: Text(
            buttonText,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: textColor ?? AppColors.whiteText, fontWeight: FontWeight.bold),
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color ?? AppColors.mainPrimary),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
      ),
    );
  }
}
