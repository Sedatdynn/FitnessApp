import 'package:flutter/material.dart';

class LogoBody extends StatelessWidget {
  const LogoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 200.0;
    return Container(
      height: height,
      child: LogoPath.logo.toWidget(),
      alignment: Alignment.center,
    );
  }
}

enum LogoPath { logo }

extension LogoPathExtension on LogoPath {
  String path() {
    return "assets/${LogoPath.logo.name}.png";
  }

  Widget toWidget() {
    return Image.asset(path());
  }
}
