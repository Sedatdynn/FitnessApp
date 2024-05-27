import 'package:core/language/language_enum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// language singleton manager
@immutable
final class LanguageManager {
  const LanguageManager._init();
  static LanguageManager? _instance;
  static LanguageManager? get instance {
    return _instance ??= const LanguageManager._init();
  }

  /// language asset path
  String get localizationPath => 'packages/core/assets/translations';

  /// app's supported languages
  static final List<Locale> supportedLocales = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  // change application language
  void changeLanguage({required BuildContext context}) {
    //getting selected current language
    final currentLocale = EasyLocalization.of(context)!.currentLocale!;
    // toggle language between English and Turkish
    currentLocale == Locales.en.locale
        ? context.setLocale(Locales.tr.locale)
        : context.setLocale(Locales.en.locale);
  }
}
