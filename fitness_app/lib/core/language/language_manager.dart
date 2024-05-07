import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/core/language/language_enum.dart';
import 'package:flutter/material.dart';

/// language singleton manager
@immutable
final class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= const LanguageManager._init();
    return _instance!;
  }

  const LanguageManager._init();

  /// language asset path
  String get localizationPath => 'assets/translations';

  /// app's supported languages
  static final List<Locale> supportedLocales = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  // change application language
  void changeLanguage({required BuildContext context}) {
    //getting selected current language
    Locale currentLocale = EasyLocalization.of(context)!.currentLocale!;
    // toggle language between English and Turkish
    currentLocale == Locales.en.locale
        ? context.setLocale(Locales.tr.locale)
        : context.setLocale(Locales.en.locale);
  }
}
