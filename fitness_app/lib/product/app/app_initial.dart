import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/firebase_options.dart';
import 'package:fistness_app_firebase/product/const/app/app_constant.dart';
import 'package:fistness_app_firebase/product/product_shelf.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
final class AppInitialize {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    //initialize the firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // initialize the app's route manager
    RouteManager.instance.init(AppConstants.appRouter);

    // observe bloc changes
    Bloc.observer = const AppBlocObserver();

    //initialize the shared preferences manager
    await CacheManager.preferencesInit();

    //initialize the network manager
    await NetworkManager.instance!.init(
      baseUrl: AppEnv().baseUrl,
      sendTimeOut: AppConstants.sendTimeout,
      connectTimeOut: AppConstants.connectTimeout,
      receiveTimeOut: AppConstants.receiveTimeout,
    );

    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
}
