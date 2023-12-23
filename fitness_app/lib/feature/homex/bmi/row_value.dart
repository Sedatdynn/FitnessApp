import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:flutter/material.dart';

Widget rowValues(BuildContext context, String text1, String text2) {
  return Row(
    children: [
      Text(
        text1,
        style: context.textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
      Expanded(
        child: Container(),
      ),
      Text(
        text2,
        style: context.textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    ],
  );
}
