import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/welcome/splash/view_mixin/splash_mixin.dart';
import 'package:fistness_app_firebase/gen/assets.gen.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
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
              Assets.lottie.lottieLoading.lottie(
                height: context.dynamicHeight(0.3),
                width: context.dynamicWidth(0.5),
              ),
              Text(
                LocaleKeys.appName,
                textAlign: TextAlign.center,
                style: context.textTheme.displaySmall?.copyWith(color: AppColors.loadingColor),
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
