import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFFC93F28); // Main deep orange/red
  static const Color backgroundColor = Color(0xFFFEF0D6); // Creamy background

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

    // --- Color Scheme ---
    // Defines the overall color configuration for the app.
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      onPrimary: lightTextColor, // Text on primary color surfaces (e.g., buttons)

      background: backgroundColor,
      onBackground: darkTextColor, // Default text color for the app background

      surface: backgroundColor, // Color for surfaces like cards
      onSurface: darkTextColor, // Default text color on surfaces
    ),

    // --- Text Theme ---
    // Sets 'Raleway' as the default font and applies the default text color.
    textTheme: GoogleFonts.ralewayTextTheme().apply(
      bodyColor: darkTextColor,
      displayColor: darkTextColor,
    ),

    // --- Specific Widget Themes ---
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

