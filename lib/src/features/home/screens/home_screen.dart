import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 3,
                bottom: 0,
                right: 0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 28,
                    ),
                    onPressed: () {
                      /* TODO: Implement drawer functionality */
                    },
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: _TabButtons()),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const _FeatureGrid(),
            const SizedBox(height: 18),

            _FeaturedSection(
              title: 'Featured Wallpaper',
              imagePaths: const [
                'assets/images/featured wallpaper 1.jpg',
                'assets/images/featured wallpaper 2.jpg',
                'assets/images/featured wallpaper 3.jpg',
              ],
            ),
            const SizedBox(height: 16),

            _FeaturedSection(
              title: 'Featured Quotes',
              imagePaths: const [
                'assets/images/featured_quotes_1.jpg',
                'assets/images/featured_quotes_2.jpg',
                'assets/images/featured_quotes_3.jpg',
              ],
            ),
            const SizedBox(height: 16),

            _FeaturedSection(
              title: 'Featured Memorial Cards',
              imagePaths: const [
                'assets/images/featured MCards 1.jpg',
                'assets/images/featured MCards 2.jpg',
                'assets/images/featured MCards 3.jpg',
              ],
            ),
            const SizedBox(height: 16),

            _FeaturedSection(
              title: 'Announcement',
              isSingleItem: true,
              imagePaths: const ['assets/images/announcement.jpg'],
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButtons extends StatelessWidget {
  const _TabButtons();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildTabButton(
            context,
            text: 'Popular',
            iconPath: 'assets/icons/popular.svg',
          ),
          const SizedBox(width: 21),
          _buildTabButton(
            context,
            text: 'Latest',
            iconPath: 'assets/icons/latest.svg',
          ),
          const SizedBox(width: 21),
          _buildTabButton(
            context,
            text: 'Gratitude',
            iconPath: 'assets/icons/grief_and_loss.svg',
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(
    BuildContext context, {
    required String text,
    required String iconPath,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final constantColor = colorScheme.onSurface;

    return ElevatedButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(
        iconPath,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(constantColor, BlendMode.srcIn),
      ),
      label: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: constantColor,
        backgroundColor: colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}

class _FeatureGrid extends StatelessWidget {
  const _FeatureGrid();

  @override
  Widget build(BuildContext context) {
    const features = {
      'Cardinal Sounds': 'assets/icons/cardinal_sounds.svg',
      'Wallpaper': 'assets/icons/wallpaper.svg',
      'Nature Sounds': 'assets/icons/nature_sounds.svg',
      'Sleeping Sounds': 'assets/icons/sleeping_sounds.svg',
      'Meditation': 'assets/icons/meditation.svg',
      'Breathing Exercises': 'assets/icons/breathing.png',
      'Short Meditations': 'assets/icons/short_meditations.svg',
      'Meditational Audios': 'assets/icons/meditational_audios.png',
      'Top Quotes': 'assets/icons/top_quotes.svg',
      'Soul Check-In': 'assets/icons/soul_check_in.svg',
      'Sacred Journals': 'assets/icons/sacred_journals.svg',
      'Medicine Notes': 'assets/icons/medicine_notes.svg',
      'Memorial Cards': 'assets/icons/memorial_cards.svg',
      'Save': 'assets/icons/save.svg',
      'Cardinal Quotes': 'assets/icons/cardinal_quotes.svg',
    };

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 15, bottom: 8),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final title = features.keys.elementAt(index);
          final iconPath = features.values.elementAt(index);
          return _buildGridItem(context, title: title, iconPath: iconPath);
        },
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context, {
    required String title,
    required String iconPath,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget iconWidget;
    const iconSize = 35.0;

    if (iconPath.endsWith('.svg')) {
      iconWidget = SvgPicture.asset(
        iconPath,
        height: iconSize,
        width: iconSize,
        colorFilter: const ColorFilter.mode(
          AppTheme.buttonBrown,
          BlendMode.srcIn,
        ),
      );
    } else {
      iconWidget = Image.asset(
        iconPath,
        height: iconSize,
        width: iconSize,
        color: AppTheme.buttonBrown,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(height: 4),
          Text(
            title.replaceAll(' ', '\n'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
              fontSize: 13,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedSection extends StatelessWidget {
  final String title;
  final List<String> imagePaths;
  final bool isSingleItem;

  const _FeaturedSection({
    required this.title,
    required this.imagePaths,
    this.isSingleItem = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final screenWidth = MediaQuery.of(context).size.width;
    // The new parent Padding has a left padding of 24.
    final availableWidth =
        screenWidth - (24.0 + 16.0); // 24 left, 16 right (from parent ListView)
    // Formula to show ~2.2 items.
    final cardWidth = (availableWidth - (1.2 * 12.0)) / 2.5;

    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: colorScheme.onPrimary,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 0),
          SizedBox(
            height: isSingleItem ? 160 : 130,
            child: isSingleItem
                ? Padding(
                    padding: const EdgeInsets.only(right: 23.0, bottom: 21),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        imagePaths.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(color: Colors.grey),
                      ),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            imagePaths[index],
                            width: cardWidth,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(color: Colors.grey),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
