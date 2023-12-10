import 'package:fistness_app_firebase/core/cache/cache_manager.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

@immutable
final class AppInitialize {
  Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await CacheManager.preferencesInit();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
