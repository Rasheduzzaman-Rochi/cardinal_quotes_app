import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Core App Colors
  static const Color _primaryColor = Color(0xFFC93F28); // Main deep orange/red
  static const Color _backgroundColor = Color(0xFFF5EFE5); // Creamy background

  // Text Colors
  static const Color _darkTextColor = Color(
    0xFF591A0E,
  ); // For text on light backgrounds (like cream)
  static const Color _lightTextColor = Color(
    0xFFFEF0D6,
  ); // For text on dark backgrounds (like orange/red)

  // --- THEME DATA CONFIGURATION ---
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    primaryColor: _primaryColor,
    scaffoldBackgroundColor: _backgroundColor,

    // --- Color Scheme ---
    // We define how colors are used semantically.
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      onPrimary: _lightTextColor,

      background: _backgroundColor,
      onBackground: _darkTextColor, // Default text color for the app background

      surface: _backgroundColor, // Color for surfaces like cards
      onSurface: _darkTextColor, // Default text color for widgets on surfaces
    ),

    // --- Text Theme ---
    // Set 'Raleway' as the default font and apply the default text color.
    textTheme: GoogleFonts.ralewayTextTheme().apply(
      bodyColor: _darkTextColor, // Default color for general text
      displayColor: _darkTextColor, // Default color for headlines
    ),

    // --- Specific Widget Themes ---
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: _darkTextColor),
      titleTextStyle: TextStyle(
        color: _darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
