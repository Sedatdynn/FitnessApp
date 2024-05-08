import 'package:fistness_app_firebase/gen/assets.gen.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:flutter/material.dart';

/// Logo Widget to show in the different screens
class LogoBody extends StatelessWidget {
  const LogoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Assets.lottie.lottieExercise.lottie(
        height: context.dynamicHeight(0.25),
        width: context.dynamicWidth(0.5),
      ),
    );
  }
}
