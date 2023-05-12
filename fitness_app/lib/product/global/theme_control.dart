import 'package:google_fonts/google_fonts.dart';

import '../../feature/views_shelf.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLight = false;

  void changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }

  ThemeData get currentTheme => isLight
      ? ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(
            (0xFF19282F),
          ),
          //listTile theme
          listTileTheme: const ListTileThemeData(
            iconColor: Color.fromARGB(255, 96, 25, 211),
            textColor: Color.fromARGB(255, 16, 16, 16),
          ),
          //textThee=me
          textTheme: TextTheme(
            subtitle1: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 3, 2, 2),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            headline4: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 15, 11, 11),
            ),
            headline6: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 19, 18, 18)),
            subtitle2: GoogleFonts.poppins(
              color: const Color(0xffFFFFFF),
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
          //iconTheme
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 96, 25, 211),
          ),
        )
      : ThemeData(
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
        );
}
