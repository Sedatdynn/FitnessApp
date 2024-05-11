import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';

@immutable
final class AppConstants {
  const AppConstants._();
  static final appRouter = AppRouter();
  static const sendTimeout = 60;
  static const connectTimeout = 69;
  static const receiveTimeout = 60;
}

const kZero = 0;
