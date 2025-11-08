import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/feature_grid.dart';
import '../widgets/featured_section.dart';
import '../widgets/tab_buttons.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<int> onTabChange;
  const HomeScreen({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                top: 3.h,
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
                      size: 28.w,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  SizedBox(width: 12.w),
                  // Pass the callback to the TabButtons widget
                  Expanded(child: TabButtons(onTabChange: onTabChange)),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            FeatureGrid(onTabChange: onTabChange),
            SizedBox(height: 18.h),

            FeaturedSection(
              title: 'Featured Wallpaper',
              imagePaths: const [
                'assets/images/featured wallpaper 1.jpg',
                'assets/images/featured wallpaper 2.jpg',
                'assets/images/featured wallpaper 3.jpg',
              ],
            ),
            SizedBox(height: 16.h),

            FeaturedSection(
              title: 'Featured Quotes',
              imagePaths: const [
                'assets/images/featured_quotes_1.jpg',
                'assets/images/featured_quotes_2.jpg',
                'assets/images/featured_quotes_3.jpg',
              ],
            ),
            SizedBox(height: 16.h),

            FeaturedSection(
              title: 'Featured Memorial Cards',
              imagePaths: const [
                'assets/images/featured MCards 1.jpg',
                'assets/images/featured MCards 2.jpg',
                'assets/images/featured MCards 3.jpg',
              ],
            ),
            SizedBox(height: 16.h),

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