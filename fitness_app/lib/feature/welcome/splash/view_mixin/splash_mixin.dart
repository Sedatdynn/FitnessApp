import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/feature/welcome/splash/view/splash_view.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';

mixin SplashMixin on State<SplashView> {
  Future<void> initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    final String? myToken = CacheManager.instance.getStringValue(CacheKeys.token.name);
    bool? isSuccess = ((myToken != null) && myToken.isNotEmpty) ? true : false;
    if (isSuccess) {
      RouteManager.instance.pushAndPopUntil(const MainRoute());
    } else {
      RouteManager.instance.pushAndPopUntil(const LaunchRoute());
    }
  }
}
