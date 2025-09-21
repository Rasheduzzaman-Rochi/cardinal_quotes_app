import 'package:flutter/material.dart';
import '../widgets/feature_grid.dart';
import '../widgets/featured_section.dart';
import '../widgets/tab_buttons.dart';

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
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: TabButtons()),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const FeatureGrid(),
            const SizedBox(height: 18),

            FeaturedSection(
              title: 'Featured Wallpaper',
              imagePaths: const [
                'assets/images/featured wallpaper 1.jpg',
                'assets/images/featured wallpaper 2.jpg',
                'assets/images/featured wallpaper 3.jpg',
              ],
            ),
            const SizedBox(height: 16),

            FeaturedSection(
              title: 'Featured Quotes',
              imagePaths: const [
                'assets/images/featured_quotes_1.jpg',
                'assets/images/featured_quotes_2.jpg',
                'assets/images/featured_quotes_3.jpg',
              ],
            ),
            const SizedBox(height: 16),

            FeaturedSection(
              title: 'Featured Memorial Cards',
              imagePaths: const [
                'assets/images/featured MCards 1.jpg',
                'assets/images/featured MCards 2.jpg',
                'assets/images/featured MCards 3.jpg',
              ],
            ),
            const SizedBox(height: 16),

            FeaturedSection(
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