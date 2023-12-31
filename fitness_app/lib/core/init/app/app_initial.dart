import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/core/init/network/network_manager.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/firebase_options.dart';
import 'package:fistness_app_firebase/product/const/app/app_constant.dart';

@immutable
final class AppInitialize {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await CacheManager.preferencesInit();
    await NetworkManager.instance.init(
      baseUrl: AppConstants.baseUrl,
      sendTimeOut: AppConstants.sendTimeout,
      connectTimeOut: AppConstants.connectTimeout,
      receiveTimeOut: AppConstants.receiveTimeout,
    );
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
