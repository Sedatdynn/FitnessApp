import 'package:fistness_app_firebase/gen/assets.gen.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:flutter/material.dart';

/// Loading Lottie widget
class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Assets.lottie.lottieLoading.lottie(
      height: context.dynamicHeight(0.3),
      width: context.dynamicWidth(0.5),
    ));
  }
}
