import 'package:flutter/material.dart';

class LogoBody extends StatelessWidget {
  const LogoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 200.0;
    return Container(
      height: height,
      alignment: Alignment.center,
      child: LogoPath.logo.toWidget(),
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
