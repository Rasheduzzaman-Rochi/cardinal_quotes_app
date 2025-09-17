import 'package:cardinal_quotes_app/src/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CardinalQuotesApp());
}

class CardinalQuotesApp extends StatelessWidget {
  const CardinalQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(
      ),
    );
  }
}