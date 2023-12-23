import 'package:flutter/material.dart';

Widget rowValues(BuildContext context, String text1, String text2) {
  return Row(
    children: [
      Text(
        text1,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
      Expanded(
        child: Container(),
      ),
      Text(
        text2,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    ],
  );
}
