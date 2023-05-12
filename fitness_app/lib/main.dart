import 'feature/service/foods_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/init/network/project_network.dart';
import 'feature/home/bottomNavigateBar/navigare_bar.dart';
import 'feature/launch/launch_page.dart';
import 'feature/views_shelf.dart';
import 'firebase_options.dart';
import 'product/global/theme_control.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(
        create: (context) => ThemeNotifier(),
      )
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool?> initialization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? isSuccess =
        await FoodsService(ProjectNetworkManager.instance.service, "token")
            .checkToken(prefs.getString("token"));
    if (isSuccess!) {
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
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: context.watch<ThemeNotifier>().currentTheme,
                home: const MainPage(),
              );
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: context.watch<ThemeNotifier>().currentTheme,
              home: const LaunchPage(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
