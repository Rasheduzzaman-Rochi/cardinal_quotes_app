import 'package:cardinal_quotes_app/src/features/main/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'constants/app_theme.dart';
import 'features/authentication/screens/signup_screen.dart';

class CardinalQuotesApp extends StatelessWidget {
  const CardinalQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardinal Quotes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}