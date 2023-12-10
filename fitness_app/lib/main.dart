import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/feature/login/view_model/login_view_model.dart';
import 'package:fistness_app_firebase/product/enum/cache/cache_enum.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'core/init/app/app_initial.dart';
import 'feature/views_shelf.dart';
import 'product/global/theme_control.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await AppInitialize().init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      ),
      ChangeNotifierProvider<LoginViewModel>(
        create: (context) => LoginViewModel(),
      )
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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

  final _appRouter = AppRouter();
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
                      routerConfig: _appRouter.config(),
                    );
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
                    routerConfig: _appRouter.config(),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
