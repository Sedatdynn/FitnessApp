import 'package:core/language/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/app.dart';
import 'package:fistness_app_firebase/bootstrap.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await bootstrap(
    () => const LocalizationWidget(),
  );
}

class LocalizationWidget extends StatelessWidget {
  const LocalizationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GlobalCubit(),
      child: EasyLocalization(
        supportedLocales: LanguageManager.supportedLocales,
        path: LanguageManager.instance!.localizationPath,
        useOnlyLangCode: true,
        child: const App(),
      ),
    );
  }
}
