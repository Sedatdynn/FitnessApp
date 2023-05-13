import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double dynamicHeight(double value) => height * value;
  double dynamicWidth(double value) => width * value;
}
