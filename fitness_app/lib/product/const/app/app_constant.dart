import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';

@immutable
final class AppConstants {
  const AppConstants._();
  static final appRouter = AppRouter();
  static const String baseUrl = 'http://10.0.2.2:8000';
  static const sendTimeout = 60;
  static const connectTimeout = 69;
  static const receiveTimeout = 60;
}

const kZero = 0;

@immutable
final class ResponsiveConstants {
  const ResponsiveConstants._();

  static const BorderSide _customPickerBorderSide = BorderSide(
    color: Color(0xFFC4FB6D),
    width: 3,
  );
  static const Border customPickerBorder =
      Border(top: _customPickerBorderSide, bottom: _customPickerBorderSide);
}
