import 'package:fistness_app_firebase/views/views_shelf.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get scfBackColor => theme.scaffoldBackgroundColor;
  Color get mainColor => theme.errorColor;
  Color get textColor => theme.hintColor;
  // Color get errColor => const Color.fromRGBO(183, 28, 28, 1);
  Color get scndTxtColor => theme.primaryColor;
  Color get shadeGreyColor => theme.shadowColor;
  Color get greenColor => theme.canvasColor;
}
