import 'package:flutter/material.dart';
import '../../../constants/app_theme.dart';
import '../widgets/emotionChoice.dart';

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
                      child: EmotionChoice(
                        icon: Icons.sentiment_very_satisfied_outlined,
                        text: 'Awesome',
                      ),
                    ),
                    Expanded(
                      child: EmotionChoice(
                        icon: Icons.sentiment_satisfied_outlined,
                        text: 'Good',
                      ),
                    ),
                    Expanded(
                      child: EmotionChoice(
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
                      child: EmotionChoice(
                        icon: Icons.sentiment_dissatisfied_outlined,
                        text: 'Bad',
                      ),
                    ),
                    Expanded(
                      child: EmotionChoice(
                        icon: Icons.sentiment_very_dissatisfied_outlined,
                        text: 'Terrible',
                      ),
                    ),
                    Expanded(child: EmotionChoice(text: 'Others', icon: null)),
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
