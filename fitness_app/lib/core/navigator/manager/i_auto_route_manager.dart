import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';

abstract class IRouteManager {
  void init(AppRouter router);
  void push(PageRouteInfo path);
  void pushNamed({required String path});
  void pushAndPopUntil(PageRouteInfo path);
  void pushAndPopLast(PageRouteInfo path);
  void pop();
}
