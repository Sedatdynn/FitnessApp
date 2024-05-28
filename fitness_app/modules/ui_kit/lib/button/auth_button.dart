import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.buttonText,
    required this.icon,
    required this.onPressed,
    super.key,
    required this.color,
    this.textColor,
  });
  final String buttonText;
  final Color color;
  final Widget icon;
  final Color? textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 342,
      child: OutlinedButton.icon(
        icon: icon,
        onPressed: onPressed,
        label: Center(
          child: Text(
            buttonText,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: textColor ?? Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(color),
          side: WidgetStateProperty.all<BorderSide>(BorderSide.none),
        ),
      ),
    );
  }
}
