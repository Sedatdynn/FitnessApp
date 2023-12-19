// mixin AppConstants {
//   final String baseUrl = "https://api.jsonserve.com/";
//   final String itemValue = "QFj-hS";
// }

import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';

@immutable
final class AppConstants {
  const AppConstants._();
  static final appRouter = AppRouter();
  static const String baseUrl = 'http://10.0.2.2:8000';
}

const kZero = 0;

@immutable
final class ResponsiveConstants {
  const ResponsiveConstants._();

  static const BorderSide _customPickerBorderSide = BorderSide(
    color: Color(0xFFC4FB6D),
    width: 3.0,
  );
  static const Border customPickerBorder =
      Border(top: _customPickerBorderSide, bottom: _customPickerBorderSide);
}
