import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/app/app_constant.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: context.watch<GlobalCubit>().getCurrentTheme(),
          routerDelegate: AppConstants.appRouter.delegate(),
          routeInformationParser: AppConstants.appRouter.defaultRouteParser(),
        );
      },
    );
  }
}
