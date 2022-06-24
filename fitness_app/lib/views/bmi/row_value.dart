import 'package:flutter/material.dart';

Row RowValues(String text1, String text2) {
  return Row(
    children: [
      Text(
        "$text1",
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      Expanded(
        child: Container(),
      ),
      Text(
        "$text2",
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
