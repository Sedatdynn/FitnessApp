import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/login/view_model/login_view_model.dart';
import 'package:fistness_app_firebase/product/const/app/app_constant.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'core/init/app/app_initial.dart';
import 'feature/views_shelf.dart';
import 'product/global/theme_control.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await AppInitialize().init();

  RouteManager.instance.init(AppConstants.appRouter);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      ),
      ChangeNotifierProvider<LoginViewModel>(
        create: (context) => LoginViewModel(),
      )
    ],
    builder: (context, child) => MyApp(
      appRouter: AppConstants.appRouter,
    ),
  ));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool?> initialization() async {
    final String? myToken = CacheManager.instance.getStringValue(CacheKeys.token.name);
    bool? isSuccess = ((myToken != null) && myToken.isNotEmpty) ? true : false;
    if (isSuccess) {
      FlutterNativeSplash.remove();
      return true;
    } else {
      FlutterNativeSplash.remove();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initialization(),
        builder: (context, AsyncSnapshot<dynamic> data) {
          if (data.connectionState != ConnectionState.waiting) {
            if (data.data) {
              return ScreenUtilInit(
                  designSize: const Size(360, 690),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (_, child) {
                    return MaterialApp.router(
                        debugShowCheckedModeBanner: false,
                        theme: context.watch<ThemeNotifier>().currentTheme,
                        routerDelegate: widget.appRouter.delegate(),
                        routeInformationParser: widget.appRouter.defaultRouteParser());
                  });
            }
            return ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      theme: context.watch<ThemeNotifier>().currentTheme,
                      routerDelegate: widget.appRouter.delegate(),
                      routeInformationParser: widget.appRouter.defaultRouteParser());
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
