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
        //colors
        canvasColor: Colors.green,
        errorColor: const Color.fromRGBO(183, 28, 28, 1),
        primaryColor: Colors.grey,
        shadowColor: Colors.grey.shade200,
        hintColor: Colors.white,
        scaffoldBackgroundColor: const Color(
          (0xFF19282F),
        ),
        //appbar theme
        appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xFFC4FB6D))),
        //listTile theme
        listTileTheme: const ListTileThemeData(
          iconColor: Color(0xFFC4FB6D),
          textColor: Colors.white,
        ),
        //inputDecorationTheme
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red.shade900)),
        ),
        //iconTheme
        iconTheme: const IconThemeData(color: Color(0xFFC4FB6D)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Color(0xFFC4FB6D)),
            unselectedIconTheme: IconThemeData(color: Colors.red)),

        //textTheme
        textTheme: TextTheme(
          subtitle1: GoogleFonts.poppins(
            color: const Color(0xffFFFFFF),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: GoogleFonts.poppins(
            color: const Color(0xffFFFFFF),
          ),
          headline6: GoogleFonts.poppins(color: const Color(0xffFFFFFF)),
          subtitle2: GoogleFonts.poppins(
            color: const Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      home: const LaunchPage(),
    );
  }
}
