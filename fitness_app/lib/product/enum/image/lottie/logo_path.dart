// ignore_for_file: constant_identifier_names

import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottiePath {
  lottie_exercise,
  lottie_loading;

  String get rawValue => "assets/lottie/$name.json";
  Widget toLottie(BuildContext context) {
    return Lottie.asset(
      rawValue,
      height: context.dynamicHeight(0.3),
      width: context.dynamicWidth(0.5),
    );
  }
}
