import 'package:flutter/material.dart';

import 'const_shelf.dart';

Widget topBox(
        BuildContext context,
        double width,
        double height,
        Widget child,
        Color color1,
        Color color2,
        Color color3,
        EdgeInsets padding,
        EdgeInsets margin) =>
    Container(
      width: width,
      height: height,
      decoration: commonBoxDec(color1, color2, color3),
      child: child,
      padding: padding,
      margin: margin,
    );
