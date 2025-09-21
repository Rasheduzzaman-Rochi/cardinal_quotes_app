import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        color: colorScheme.background,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            _buildDrawerHeader(context),
            const SizedBox(height: 20),

            // Pass the colorScheme to each drawer item
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/explore.svg', text: 'Explore'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/popular.svg', text: 'Popular'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/latest.svg', text: 'Latest'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/cardinal_sounds.svg', text: 'Cardinal Sound'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/wallpaper.svg', text: 'Wallpaper'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/nature_sounds.svg', text: 'Natural Sound'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/sleeping_sounds.svg', text: 'Sleeping'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/meditation.svg', text: 'Meditation'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/breathing.svg', text: 'Breathing Exercise'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/meditational_audios.svg', text: 'Meditational Audios'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/short_meditations.svg', text: 'Short Meditation'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/top_quotes.svg', text: 'Top Quotes'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/soul_check_in.svg', text: 'Soul Check-In'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/sacred_journals.svg', text: 'Sacred Journals'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/medicine_notes.svg', text: 'Medicine Note'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/memorial_cards.svg', text: 'Memorial Card'),
            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/save.svg', text: 'Save'),

            const SizedBox(height: 20),
            const Divider(thickness: 1),
            const SizedBox(height: 10),

            _buildDrawerItem(colorScheme, iconPath: 'assets/icons/logout.svg', text: 'Log Out'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/menu_bird_L.jpg',
                  fit: BoxFit.cover,
                  height: 160,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/menu_bird_R.jpg',
                  fit: BoxFit.cover,
                  height: 160,
                ),
              ),
            ],
          ),

          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black38,
                child: Icon(Icons.close, color: Colors.white, size: 16),
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            right: 40,
            child: Text(
              '"Peace comes from within. Do not seek it without."',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.7),
                    offset: const Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Text(
              'Buddha',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12,
                fontStyle: FontStyle.italic,
                shadows: [
                  Shadow(
                    blurRadius: 8.0,
                    color: Colors.black.withOpacity(0.6),
                    offset: const Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // UPDATED: Now takes ColorScheme as a parameter
  Widget _buildDrawerItem(ColorScheme colorScheme, {required String iconPath, required String text}) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,
        height: 24,
        width: 24,
        colorFilter: const ColorFilter.mode(AppTheme.buttonBrown, BlendMode.srcIn),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          // UPDATED: Using the onSurface color from the theme's colorScheme
          color: colorScheme.onSurface,
        ),
      ),
      onTap: () {
        // TODO: Implement navigation for each drawer item.
      },
    );
  }
}
