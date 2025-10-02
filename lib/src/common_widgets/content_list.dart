import 'package:flutter/material.dart';
import 'memorial_image_card.dart';

class ContentListScreen extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final VoidCallback? onBackTapped;

  const ContentListScreen({
    super.key,
    required this.title,
    required this.items,
    this.onBackTapped,
  });

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
                  onPressed: onBackTapped ?? () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 5),
                Text(
                  title,
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return MemorialImageCard(
            imagePath: item['imagePath']!,
            tags: item['tags']!,
          );
        },
      ),
    );
  }
}
