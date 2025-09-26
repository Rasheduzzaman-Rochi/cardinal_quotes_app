import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFFC93F28);
  static const Color backgroundColor = Color(0xFFFEF0D6);

  // Text Colors
  static const Color darkTextColor = Color(0xFF52180D);
  static const Color lightTextColor = Color(0xFFFEF0D6);

  // Component-Specific Colors from the design
  static const Color buttonBrown = Color(0xFF8B5742);
  static const Color buttonBrownDark = Color(0xFF52180D);
  static const Color textFieldBorder = Color(0xFFDCC8AF);
  static const Color unselectedBorder = Color(0xFF976E5C);

  // --- MAIN THEME DATA ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,

    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      onPrimary: lightTextColor,

      background: backgroundColor,
      onBackground: darkTextColor,

      surface: backgroundColor,
      onSurface: darkTextColor,
    ),


    textTheme: GoogleFonts.ralewayTextTheme().apply(
      bodyColor: darkTextColor,
      displayColor: darkTextColor,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: darkTextColor),
      titleTextStyle: TextStyle(
        color: darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

