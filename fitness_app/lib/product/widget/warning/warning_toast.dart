import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../theme/colors.dart';

Future<bool?> warningToast(String text, {Color? color = Colors.red}) {
  return Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: color,
      textColor: AppColors.whiteText,
      fontSize: 14);
}
