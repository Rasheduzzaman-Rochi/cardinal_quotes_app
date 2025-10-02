import 'package:flutter/material.dart';
import '../../../common_widgets/content_list.dart';

class SoulScreen extends StatelessWidget {
  final VoidCallback onBackTapped;
  const SoulScreen({super.key, required this.onBackTapped});

  static const List<Map<String, String>> _soulCheckItems = [
    {
      'imagePath': 'assets/images/memo_1.jpg',
      'tags': '#Ambition    #Inspiration    #Motivational',
    },
    {
      'imagePath': 'assets/images/memo_2.jpg',
      'tags': '#Ambition    #Inspiration    #Motivational',
    },
    {
      'imagePath': 'assets/images/memo_1.jpg',
      'tags': '#Ambition    #Inspiration    #Motivational',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ContentListScreen(
      title: 'Soul Check-In',
      items: _soulCheckItems,
      onBackTapped: onBackTapped,
    );
  }
}