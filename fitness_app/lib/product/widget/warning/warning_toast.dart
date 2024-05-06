import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../theme/colors.dart';

/// Toast messages for warnings and success operations

Future<void> warningToast(String text, {Color? color = Colors.red}) {
  return Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: color,
      textColor: AppColors.whiteText,
      fontSize: 14.sp);
}
