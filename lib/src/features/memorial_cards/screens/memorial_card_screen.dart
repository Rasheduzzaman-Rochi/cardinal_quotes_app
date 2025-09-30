import 'package:flutter/material.dart';

class MemorialCardScreen extends StatelessWidget {
  // The onBackTapped callback is no longer needed.
  const MemorialCardScreen({super.key});

  static const List<Map<String, String>> _memorialItems = [
    {
      'imagePath': 'assets/images/memo_1.jpg',
      'tags': '#Ambition #Inspiration #Motivational',
    },
    {
      'imagePath': 'assets/images/memo_2.jpg',
      'tags': '#Ambition #Inspiration #Motivational',
    },
    {
      'imagePath': 'assets/images/memo_1.jpg', // Reusing the first image
      'tags': '#Ambition #Inspiration #Motivational',
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
                  // The onPressed callback now simply pops the current screen.
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 5),
                Text(
                  'Memorial Card',
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
          return _MemorialImageCard(
            imagePath: item['imagePath']!,
            tags: item['tags']!,
          );
        },
      ),
    );
  }
}

class _MemorialImageCard extends StatelessWidget {
  final String imagePath;
  final String tags;

  const _MemorialImageCard({required this.imagePath, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey,
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tags,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                _buildActionRow(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionIcon(
            context, icon: Icons.remove_red_eye_outlined, text: '567.57k'),
        _buildActionIcon(context, icon: Icons.share_outlined, text: 'Share'),
        _buildActionIcon(
            context, icon: Icons.download_outlined, text: 'Download'),
        _buildActionIcon(context, icon: Icons.bookmark_border, text: 'Save'),
      ],
    );
  }

  Widget _buildActionIcon(BuildContext context,
      {required IconData icon, required String text}) {
    final iconColor = Colors.white;
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: iconColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}