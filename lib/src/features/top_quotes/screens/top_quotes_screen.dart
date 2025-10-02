import 'package:flutter/material.dart';
import '../../../common_widgets/content_list.dart';

class TopQuotesScreen extends StatelessWidget {
  final VoidCallback onBackTapped;
  const TopQuotesScreen({super.key, required this.onBackTapped});

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
    return ContentListScreen(
      title: 'Top Quotes',
      items: _memorialItems,
      onBackTapped: onBackTapped,
    );
  }
}