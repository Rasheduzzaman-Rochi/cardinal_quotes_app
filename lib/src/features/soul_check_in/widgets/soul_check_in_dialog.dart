import 'package:flutter/material.dart';
import '../../../constants/app_theme.dart';

class SoulCheckInDialog extends StatelessWidget {
  const SoulCheckInDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'How Are You Feeling Today?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: _EmotionChoice(icon: Icons.sentiment_very_satisfied_outlined, text: 'Awesome')),
                        Expanded(child: _EmotionChoice(icon: Icons.sentiment_satisfied_outlined, text: 'Good')),
                        Expanded(child: _EmotionChoice(icon: Icons.sentiment_neutral_outlined, text: 'Neutral')),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Expanded(child: _EmotionChoice(icon: Icons.sentiment_dissatisfied_outlined, text: 'Bad')),
                        Expanded(child: _EmotionChoice(icon: Icons.sentiment_very_dissatisfied_outlined, text: 'Terrible')),
                        Expanded(child: _EmotionChoice(icon: Icons.waves, text: 'Others')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: -16,
              right: -16,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const CircleAvatar(
                  radius: 14,
                  backgroundColor: AppTheme.unselectedBorder,
                  child: Icon(Icons.close, color: AppTheme.buttonBrownDark, size: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmotionChoice extends StatelessWidget {
  final IconData icon;
  final String text;

  const _EmotionChoice({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Implement emotion selection logic
        Navigator.of(context).pop();
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        // This FittedBox prevents the content from overflowing by scaling it down if necessary.
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.onSurface, size: 22),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
