import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    backgroundColor: const Color(0xFFF6F5F8),
    scaffoldBackgroundColor: const Color(0xFFF0EFEF),
    colorScheme: const ColorScheme(
      primary: Color(0xff152F4B),
      primaryContainer: Color(0xFF161EEE),
      secondary: Color(0xff152F4B),
      secondaryContainer: Color(0xff152F4B),
      surface: Color(0xffFFFFFF),
      background: Color(0xffFFFFFF),
      error: Color(0xffB00020),
      onPrimary: Color(0xff1e1e29),
      onSecondary: Color(0xFFF6F5F8),
      onSurface: Color(0xff000000),
      onBackground: Color(0xff000000),
      onError: Color(0xffB00020),
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      // toolbarHeight: 35,
      backgroundColor: const Color(0xFFF0EFEF),
      titleTextStyle: GoogleFonts.cairo(
        color: const Color(0xff1B1C1C),
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        letterSpacing: 0.15,
      ),
      iconTheme: const IconThemeData(color: Color((0xff152F4B))),
    ),
    toggleableActiveColor: const Color(0xff152F4B).withOpacity(0.8),
    // radioTheme: RadioThemeData(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
      backgroundColor: Color(0xffFFFFFF),
      enableFeedback: true,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 12.0),
      selectedIconTheme: IconThemeData(color: Color(0xff6e9ed3),),
    ),

    timePickerTheme: TimePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      dialBackgroundColor: const Color(0xff152F4B).withOpacity(0.9),
      dialHandColor: const Color(0xff152F4B),
      dialTextColor: Colors.white,
      hourMinuteColor: const Color(0xff152F4B).withOpacity(0.05),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      hourMinuteTextColor: const Color(0xff152F4B),
    ),
    dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),),),

    textTheme: TextTheme(
      labelLarge: GoogleFonts.cairo(

      ),
      labelSmall:const TextStyle(
        fontFamily: 'Cairo'
      ),
      bodyLarge:const TextStyle(
          fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
      ),
      bodyMedium:const TextStyle(
          fontFamily: 'Cairo'
      ),
      displayLarge: const TextStyle(
          fontFamily: 'Cairo'
      ),
      displayMedium:const TextStyle(
          fontFamily: 'Cairo'
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF071D34)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xff152F4B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ), backgroundColor: const Color(0xff152F4B).withOpacity(0.8),
        textStyle: GoogleFonts.cairo(
            fontWeight: FontWeight.bold),
        padding: const EdgeInsets.all(10.0),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xff152F4B).withOpacity(0.8), shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        textStyle: GoogleFonts.cairo(
            fontWeight: FontWeight.bold),
        padding: const EdgeInsets.all(0.0),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.sp),
      ),
    ),
  );
}
