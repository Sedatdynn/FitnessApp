import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.buttonText,
    required this.icon,
    required this.onPressed,
    super.key,
    this.color,
    this.textColor,
  });
  final String buttonText;
  final Color? color;
  final Widget icon;
  final Color? textColor;
  final VoidCallback onPressed;

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
          side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
        ),
      ),
    );
  }
}
