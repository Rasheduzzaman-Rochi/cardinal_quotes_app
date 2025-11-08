import 'package:flutter/material.dart';
import '../widgets/audio_card.dart';

class AudioListScreen extends StatelessWidget {

  final VoidCallback onBackTapped;
  const AudioListScreen({super.key, required this.onBackTapped});

  static const List<Map<String, String>> _audioItems = [
    {
      'title': 'Wiper',
      'imagePath': 'assets/images/dummy_car.jpg',
      'tags': '#Ambition    #Inspiration    #Motivational',
    },
    {
      'title': 'Rain',
      'imagePath': 'assets/images/wiper_image.jpg',
      'tags': '#Ambition    #Inspiration    #Motivational',
    },
    {
      'title': 'Forest',
      'imagePath': 'assets/images/dummy_car.jpg',
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
                  'Sleep Sounds',
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
        itemCount: _audioItems.length,
        itemBuilder: (context, index) {
          final item = _audioItems[index];
          return AudioCard(
            title: item['title']!,
            imagePath: item['imagePath']!,
            tags: item['tags']!,
          );
        },
      ),
    );
  }
}