import 'package:core/core.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/feature/welcome/splash/view/splash_view.dart';
import 'package:fistness_app_firebase/product/navigator/app_router.dart';

mixin SplashMixin on State<SplashView> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  Future<void> initialization() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final myToken = CacheManager.instance.getStringValue(CacheKeys.token.name);
    final isSuccess = myToken != null && myToken.isNotEmpty;

    if (isSuccess) {
      RouteManager.instance.pushAndPopUntil(const MainRoute());
    } else {
      RouteManager.instance.pushAndPopUntil(const LaunchRoute());
    }
  }
}
