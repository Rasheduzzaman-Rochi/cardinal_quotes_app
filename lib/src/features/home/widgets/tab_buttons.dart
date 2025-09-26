import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabButtons extends StatelessWidget {
  const TabButtons({super.key, required ValueChanged<int> onTabChange});

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