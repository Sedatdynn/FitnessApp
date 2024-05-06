import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/welcome/splash/view_mixin/splash_mixin.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/text/texts.dart';
import 'package:fistness_app_firebase/product/enum/image/lottie/logo_path.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const AppPadding.normalHorizontal(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottiePath.lottie_loading.toLottie(context),
              Text(
                MyText.appName,
                textAlign: TextAlign.center,
                style: context.textTheme.displaySmall?.copyWith(color: AppColors.loadingColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
