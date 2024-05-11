import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsiveExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double dynamicHeight(double value) => height * value.h;
  double dynamicWidth(double value) => width * value.w;
}

extension CustomTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}

@immutable
final class ResponsiveConstants {
  const ResponsiveConstants._();

  static const BorderSide _customPickerBorderSide = BorderSide(
    color: Color(0xFFC4FB6D),
    width: 3,
  );
  static const Border customPickerBorder =
      Border(top: _customPickerBorderSide, bottom: _customPickerBorderSide);
}
