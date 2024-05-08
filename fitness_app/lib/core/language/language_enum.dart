import 'dart:ui';

enum Locales {
  //Turkish locale language
  tr(Locale('tr', 'TR')),

  //English locale language
  en(Locale('en', 'US'));

  const Locales(this.locale);
  final Locale locale;
}
