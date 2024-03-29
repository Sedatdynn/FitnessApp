import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/i_auto_route_manager.dart';

class RouteManager implements IRouteManager {
  static RouteManager? _instance;
  static RouteManager get instance {
    _instance ??= RouteManager._init();
    return _instance!;
  }

  late AppRouter _router;

  RouteManager._init();
  @override
  void init(AppRouter router) {
    _router = router;
  }

  @override
  void push(PageRouteInfo path) {
    _router.push(path);
  }

  @override
  void pushNamed({required String path}) {
    _router.pushNamed(path);
  }

  @override
  void pushAndPopUntil(PageRouteInfo path) {
    _router.pushAndPopUntil(path, predicate: (_) => false);
  }

  @override
  void pushAndPopLast(PageRouteInfo path) {
    _router.popAndPush(path);
  }

  @override
  void pop() => _router.pop();
}
