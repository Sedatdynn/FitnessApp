import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:flutter/material.dart';

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
        height: context.height * 0.06,
        width: context.width * 0.81,
        child: OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
            foregroundColor:
                MaterialStateProperty.all<Color>(context.textColor),
            backgroundColor: MaterialStateProperty.all(context.mainColor),
          ),
          onPressed: onPressed,
          child: Text(text, style: context.headline6(context)),
        ),
      ),
    );
  }
}
