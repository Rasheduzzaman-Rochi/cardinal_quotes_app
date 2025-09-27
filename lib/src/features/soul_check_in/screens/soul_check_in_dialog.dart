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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(width: 32),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'How Are You Feeling Today?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    customBorder: const CircleBorder(),
                    child: const Icon(
                      Icons.close,
                      color: AppTheme.buttonBrownDark,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      child: _EmotionChoice(
                        icon: Icons.sentiment_very_satisfied_outlined,
                        text: 'Awesome',
                      ),
                    ),
                    Expanded(
                      child: _EmotionChoice(
                        icon: Icons.sentiment_satisfied_outlined,
                        text: 'Good',
                      ),
                    ),
                    Expanded(
                      child: _EmotionChoice(
                        icon: Icons.sentiment_neutral_outlined,
                        text: 'Neutral',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Expanded(
                      child: _EmotionChoice(
                        icon: Icons.sentiment_dissatisfied_outlined,
                        text: 'Bad',
                      ),
                    ),
                    Expanded(
                      child: _EmotionChoice(
                        icon: Icons.sentiment_very_dissatisfied_outlined,
                        text: 'Terrible',
                      ),
                    ),
                    Expanded(
                      child: _EmotionChoice(
                        text: 'Others',
                        icon: null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmotionChoice extends StatelessWidget {
  final IconData? icon;
  final String text;

  const _EmotionChoice({this.icon, required this.text});

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
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 20,
                ),
                const SizedBox(width: 6),
              ],
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
