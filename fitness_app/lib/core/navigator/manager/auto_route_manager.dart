import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/core_shelf.dart';

class RouteManager implements IRouteManager {
  RouteManager._init();
  static RouteManager? _instance;
  static RouteManager get instance {
    return _instance ??= RouteManager._init();
  }

  late AppRouter _router;
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
