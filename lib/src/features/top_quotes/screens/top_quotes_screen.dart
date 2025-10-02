import 'package:flutter/material.dart';
import '../../../common_widgets/memorial_image_card.dart';

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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 2),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: colorScheme.onPrimary,
                    size: 35,
                  ),
                  onPressed: onBackTapped,
                ),
                const SizedBox(width: 5),
                Text(
                  'Top Quotes',
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
          left: 21.0,
          right: 21.0,
          top: 12,
          bottom: 10.0,
        ),
        itemCount: _memorialItems.length,
        itemBuilder: (context, index) {
          final item = _memorialItems[index];
          return MemorialImageCard(
            imagePath: item['imagePath']!,
            tags: item['tags']!,
          );
        },
      ),
    );
  }
}