import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/app_theme.dart';

class AudioListScreen extends StatelessWidget {
  const AudioListScreen({super.key});

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
                  onPressed: () => Navigator.of(context).pop(),
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
          return _AudioCard(
            title: item['title']!,
            imagePath: item['imagePath']!,
            tags: item['tags']!,
          );
        },
      ),
    );
  }
}

class _AudioCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String tags;

  const _AudioCard({
    required this.title,
    required this.imagePath,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primary,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImagePlayer(context),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Music: $title',
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tags,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                _buildActionRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePlayer(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            width: 190,
            height: 180,
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 12,
              bottom: 4,
            ),
            decoration: BoxDecoration(
              color: colorScheme.background,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/sound_wave.svg',
                        height: 110,
                        color: colorScheme.background,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: colorScheme.onSurface,
                      size: 32,
                    ),
                    Text(
                      '10.00',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox.shrink(),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4.0,
                    trackShape: const RoundedRectSliderTrackShape(),
                    activeTrackColor: AppTheme.buttonBrownDark,
                    inactiveTrackColor: AppTheme.buttonBrownDark.withOpacity(
                      0.3,
                    ),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0.0,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 0.0,
                    ),
                  ),
                  child: Slider(value: 1, onChanged: (value) {}),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: colorScheme.onSurface,
                    shadows: [
                      Shadow(
                        color: colorScheme.onSurface.withOpacity(0.15),
                        offset: const Offset(1, 1),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionIcon(context, icon: Icons.remove_red_eye, text: '567.57k'),
        _buildActionIcon(context, icon: Icons.share, text: 'Share'),
        _buildActionIcon(context, icon: Icons.download, text: 'Download'),
        _buildActionIcon(context, icon: Icons.bookmark, text: 'Save'),
      ],
    );
  }

  Widget _buildActionIcon(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
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
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
