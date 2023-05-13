import '../../../feature/views_shelf.dart';
import '../../const/responsive/responsive.dart';
import '../../extensions/extensions_shelf.dart';

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
      height: context.dynamicHeight(0.06),
      width: context.dynamicWidth(0.8),
      child: OutlinedButton.icon(
        icon: icon,
        onPressed: onPressed,
        label: Center(
          child: Text(
            buttonText,
            style: context.subtitle1(context)?.copyWith(
                color: textColor ?? context.textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(color ?? context.mainColor),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
      ),
    );
  }
}
