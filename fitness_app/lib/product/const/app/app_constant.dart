// mixin AppConstants {
//   final String baseUrl = "https://api.jsonserve.com/";
//   final String itemValue = "QFj-hS";
// }

import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';

@immutable
final class AppConstants {
  const AppConstants._();
  static const String baseUrl = 'http://10.0.2.2:8000';
  static final appRouter = AppRouter();
}

const kZero = 0;
