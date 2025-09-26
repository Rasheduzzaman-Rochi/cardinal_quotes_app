import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_theme.dart';
import '../../memorial_cards/screens/add_memorial_card_screen.dart';
import '../../soul_check_in/widgets/soul_check_in_dialog.dart';

class FeatureGrid extends StatelessWidget {
  final ValueChanged<int> onTabChange;
  const FeatureGrid({super.key, required this.onTabChange});

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

    return InkWell(
      onTap: () {
        if (title == 'Memorial Cards') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddMemorialCardScreen(),
            ),
          );
        } else if (title == 'Sleeping Sounds') {
          onTabChange(1);
        } else if (title == 'Soul Check-In') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SoulCheckInDialog()),
          );
        }
      },
      borderRadius: BorderRadius.circular(9),
      child: Container(
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
      ),
    );
  }
}
