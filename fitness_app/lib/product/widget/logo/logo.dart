import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoBody extends StatelessWidget {
  const LogoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 200.0;
    return Container(
        height: height,
        alignment: Alignment.center,
        child: Lottie.asset("assets/lottie/lottie_exercise.json")
        // LogoPath.logo.toWidget(),
        );
  }
}
