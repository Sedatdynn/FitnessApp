import 'package:auto_route/auto_route.dart';

abstract class IRouteManager {
  void init(dynamic router);
  void push(PageRouteInfo path);
  void pushNamed({required String path});
  void pushAndPopUntil(PageRouteInfo path);
  void pushAndPopLast(PageRouteInfo path);
  void pop();
}
