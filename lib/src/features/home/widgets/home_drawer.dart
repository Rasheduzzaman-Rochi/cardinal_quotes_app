import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      // 2. Set the drawer width to be 80% of the screen width
      width: screenWidth * 0.6,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        color: colorScheme.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  const SizedBox(height: 13),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.close,
                        color: AppTheme.buttonBrownDark,
                        size: 28,
                        weight: 700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '"Peace comes from within.\nDo not seek it without."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    'Buddha',
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 21),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/popular.svg',
                    text: 'Popular',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/latest.svg',
                    text: 'Latest',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/cardinal_sounds.svg',
                    text: 'Cardinal Sound',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/wallpaper.svg',
                    text: 'Wallpaper',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/nature_sounds.svg',
                    text: 'Natural Sound',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/sleeping_sounds.svg',
                    text: 'Sleeping',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/meditation.svg',
                    text: 'Meditation',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/short_meditations.svg',
                    text: 'Short Meditation',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/top_quotes.svg',
                    text: 'Top Quotes',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/soul_check_in.svg',
                    text: 'Soul Check-In',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/sacred_journals.svg',
                    text: 'Sacred Journals',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/medicine_notes.svg',
                    text: 'Medicine Note',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/memorial_cards.svg',
                    text: 'Memorial Card',
                  ),
                  _buildDrawerItem(
                    colorScheme,
                    iconPath: 'assets/icons/save.svg',
                    text: 'Save',
                  ),

                  const SizedBox(height: 30),
                  _buildLogoutButton(colorScheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    ColorScheme colorScheme, {
    required String iconPath,
    required String text,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -3),
      leading: SvgPicture.asset(
        iconPath,
        height: 22,
        width: 22,
        colorFilter: const ColorFilter.mode(
          AppTheme.buttonBrown,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
      ),
      onTap: () {
        // TODO: Implement navigation for each drawer item.
      },
    );
  }

  Widget _buildLogoutButton(ColorScheme colorScheme) {
    return InkWell(
      onTap: () {
        // TODO: Implement logout functionality
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log Out',
              style: TextStyle(
                // 3. Made the Log Out text bigger and bolder
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              'assets/icons/logout.svg',
              // 3. Made the Log Out icon bigger
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
