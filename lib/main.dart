import 'package:cardinal_quotes_app/src/constants/app_theme.dart';
import 'package:cardinal_quotes_app/src/features/authentication/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CardinalQuotesApp());
}

class CardinalQuotesApp extends StatelessWidget {
  const CardinalQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardinal Quotes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SignUpScreen(),
    );
  }
}
