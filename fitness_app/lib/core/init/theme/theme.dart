import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final class CustomTheme {
  ThemeData get lightTheme => ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            color: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xFFC4FB6D))),
        scaffoldBackgroundColor: const Color((0xFF19282F)),
        cardColor: AppColors.backgroundColor,

        //listTile theme
        listTileTheme: const ListTileThemeData(
          iconColor: Color.fromARGB(255, 96, 25, 211),
          textColor: Color.fromARGB(255, 16, 16, 16),
        ),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: const TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color.fromARGB(255, 10, 10, 10)),
            )),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Color(0xFFC4FB6D)),
            unselectedIconTheme: IconThemeData(color: Colors.red)),

        //textThee=me
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
            color: const Color(0xffFFFFFF),
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            fontStyle: FontStyle.normal,
          ),
          titleSmall: GoogleFonts.poppins(
            color: const Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            fontStyle: FontStyle.normal,
          ),
          titleMedium: GoogleFonts.poppins(
            color: const Color(0xffFFFFFF),
            fontSize: 20.sp,
          ),
          titleLarge: GoogleFonts.poppins(
            color: const Color(0xffFFFFFF),
            fontSize: 24.sp,
          ),
        ),
        //iconTheme
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 96, 25, 211),
        ),
      );
  ThemeData get darkTheme => ThemeData(
        //colors
        canvasColor: Colors.green,
        primaryColor: Colors.grey,
        shadowColor: Colors.grey.shade200,
        hintColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xFFE7F3D9),
        //appbar theme
        appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            titleTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            elevation: 0,
            iconTheme: IconThemeData(color: Color.fromARGB(255, 135, 109, 251))),
        //listTile theme
        listTileTheme: const ListTileThemeData(
          iconColor: Color.fromARGB(255, 135, 109, 251),
          textColor: Colors.white,
        ),
        //inputDecorationTheme
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
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
          bodyLarge: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          titleSmall: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            fontStyle: FontStyle.normal,
          ),
          titleMedium: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 20.sp,
          ),
          titleLarge: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 24.sp,
          ),
        ),
      );
}
