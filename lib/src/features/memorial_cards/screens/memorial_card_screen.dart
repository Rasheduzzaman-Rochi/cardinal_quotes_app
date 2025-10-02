import 'package:flutter/material.dart';
import '../../../common_widgets/content_list.dart';

class MemorialCardScreen extends StatelessWidget {
  const MemorialCardScreen({super.key});

  static const List<Map<String, String>> _memorialItems = [
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
    return const ContentListScreen(
      title: 'Memorial Card',
      items: _memorialItems,
    );
  }
}