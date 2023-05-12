import '../../feature/views_shelf.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get scfBackColor => theme.scaffoldBackgroundColor;
  Color get mainColor => theme.errorColor;
  Color get textColor => theme.hintColor;
  // Color get errColor => const Color.fromRGBO(183, 28, 28, 1);
  Color get scndTxtColor => theme.primaryColor;
  Color get shadeGreyColor => theme.shadowColor;
  Color get greenColor => theme.canvasColor;

  TextStyle? subtitle1(context) => theme.textTheme.subtitle1;

  TextStyle? subtitle2(context) => theme.textTheme.subtitle2;

  TextStyle? headline4(context) => theme.textTheme.headline4;

  TextStyle? headline6(context) => theme.textTheme.headline6;

  TextStyle? bdSmall(context) => theme.textTheme.bodySmall;

  // TextStyle? headline2(context) => theme.textTheme.headline2;
}
