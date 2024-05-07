import 'dart:ui';

enum Locales {
  //Turkish locale language
  tr(Locale('tr', 'TR')),

  //English locale language
  en(Locale('en', 'US'));

  final Locale locale;
  const Locales(this.locale);
}
