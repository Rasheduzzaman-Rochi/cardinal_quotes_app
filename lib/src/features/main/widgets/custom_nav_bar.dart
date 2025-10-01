import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/app_theme.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  // A list to hold the data for each navigation item
  static final List<Map<String, String>> _navItems = [
    {
      'icon': 'assets/icons/home.svg',
      'filled_icon': 'assets/icons/home_filled.svg',
      'label': 'Home',
    },
    {
      'icon': 'assets/icons/sounds.svg',
      'filled_icon': 'assets/icons/sounds_filled.svg',
      'label': 'Sounds',
    },
    {
      'icon': 'assets/icons/soul.svg',
      'filled_icon': 'assets/icons/soul_filled.svg',
      'label': 'Soul',
    },
    {
      'icon': 'assets/icons/top.svg',
      'filled_icon': 'assets/icons/top_filled.svg',
      'label': 'Top',
    },
    {
      'icon': 'assets/icons/more.svg',
      'filled_icon': 'assets/icons/more.svg',
      'label': 'More',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // Generate navigation items dynamically from the list
          children: _navItems.asMap().entries.map((entry) {
            final int index = entry.key;
            final Map<String, String> item = entry.value;
            return _buildNavItem(
              index: index,
              iconPath: item['icon']!,
              filledIconPath: item['filled_icon']!,
              label: item['label']!,
            );
          }).toList(),
        ),
      ),
    );
  }

  // A helper widget to build each navigation item
  Widget _buildNavItem({
    required int index,
    required String iconPath,
    required String filledIconPath,
    required String label,
  }) {
    final bool isSelected = selectedIndex == index;
    final color = isSelected ? AppTheme.buttonBrownDark : AppTheme.unselectedBorder;

    final String currentIconPath = isSelected ? filledIconPath : iconPath;

    return InkWell(
      onTap: () => onItemTapped(index),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              currentIconPath, // Use the dynamically chosen icon path
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              height: 28,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}