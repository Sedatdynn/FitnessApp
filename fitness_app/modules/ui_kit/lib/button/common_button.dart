import 'package:flutter/material.dart';

// Button for using all registration and home pages
class CommonButton extends StatelessWidget {
  const CommonButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.color = const Color(0xffdabcf6),
  });
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 48,
        width: 284,
        child: OutlinedButton(
          style: customButtonStyle,
          onPressed: onPressed,
          child: Text(text, style: Theme.of(context).textTheme.titleSmall),
        ),
      ),
    );
  }

  ButtonStyle get customButtonStyle => ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        backgroundColor: WidgetStateProperty.all(color),
      );
}
