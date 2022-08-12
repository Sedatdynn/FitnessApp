import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> warningToast(BuildContext context, String text,
    {Color? color = Colors.red}) {
  return Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: color,
      textColor: context.textColor,
      fontSize: 14);
}
