import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:flutter/material.dart';

enum LogoPath {
  logo;

  String get rawValue => "asset/png/$name.png";
  Widget toPng(BuildContext context) {
    return Image.asset(
      rawValue,
      color: Colors.amber,
      height: context.dynamicHeight(0.03),
      width: context.dynamicWidth(0.1),
    );
  }
}
