import 'package:fistness_app_firebase/product/enum/image/lottie/logo_path.dart';
import 'package:flutter/material.dart';

/// Logo Widget to show in the different screens
class LogoBody extends StatelessWidget {
  const LogoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center, child: LottiePath.lottie_exercise.toLottie(context));
  }
}
