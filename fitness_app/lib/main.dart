import 'package:fistness_app_firebase/bootstrap.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/product/const/app/app_constant.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/views_shelf.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await bootstrap(() => BlocProvider(
        create: (_) => GlobalCubit(),
        child: MyApp(
          appRouter: AppConstants.appRouter,
        ),
      ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: context.watch<GlobalCubit>().getCurrentTheme(),
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
          );
        });
  }
}
