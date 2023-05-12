import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  //color
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF19282F),
  primaryColor: const Color.fromRGBO(183, 28, 28, 1),
  bottomAppBarColor: Colors.transparent,
  hintColor: const Color(0xffffffff),
  errorColor: const Color.fromRGBO(183, 28, 28, 1),
  secondaryHeaderColor: Colors.grey,

  //theme
  iconTheme: const IconThemeData(color: Color(0xFFC4FB6D)),
  appBarTheme: AppBarTheme(
      color: myTheme.bottomAppBarColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: Color(0xFFC4FB6D))),
  textTheme: TextTheme(
    headline1: GoogleFonts.poppins(
      color: myTheme.hintColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline2: GoogleFonts.poppins(
      color: myTheme.hintColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline3: GoogleFonts.poppins(
      color: myTheme.hintColor,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headline4: GoogleFonts.poppins(
      color: myTheme.hintColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline5: GoogleFonts.poppins(
      color: myTheme.hintColor,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      color: myTheme.hintColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: TextStyle(
      color: myTheme.hintColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: myTheme.hintColor,
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
);
