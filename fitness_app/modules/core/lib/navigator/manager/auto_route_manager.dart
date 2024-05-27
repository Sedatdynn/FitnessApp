import 'package:auto_route/auto_route.dart';
import 'package:core/navigator/manager/i_auto_route_manager.dart';

class RouteManager implements IRouteManager {
  RouteManager._init();
  static RouteManager? _instance;

  static RouteManager get instance {
    return _instance ??= RouteManager._init();
  }

  late final dynamic _router;
  @override
  void init(dynamic router) {
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
