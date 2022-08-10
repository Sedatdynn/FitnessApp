import 'package:fistness_app_firebase/core/extensions/theme_extension.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
import 'package:fistness_app_firebase/views/views_shelf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.green,
        errorColor: const Color.fromRGBO(183, 28, 28, 1),
        primaryColor: Colors.grey,
        shadowColor: Colors.grey.shade200,
        hintColor: Colors.white,
        scaffoldBackgroundColor: const Color(
          (0xFF19282F),
        ),
        appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xFFC4FB6D))),
        listTileTheme: const ListTileThemeData(
          iconColor: Color(0xFFC4FB6D),
          textColor: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Color(0xFFC4FB6D)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Color(0xFFC4FB6D)),
            unselectedIconTheme: IconThemeData(color: Colors.red)),

        //textTheme
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Theme.of(context).hintColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            color: Theme.of(context).hintColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      home: const LaunchPage(),
    );
  }
}
