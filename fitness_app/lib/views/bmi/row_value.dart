import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

Row rowValues(BuildContext context, String text1, String text2) {
  return Row(
    children: [
      Text(
        text1,
        style: context.subtitle1(context),
        textAlign: TextAlign.center,
      ),
      Expanded(
        child: Container(),
      ),
      Text(
        text2,
        style: context.subtitle1(context),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
