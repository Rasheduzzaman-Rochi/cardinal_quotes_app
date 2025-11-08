import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 20.0.h),
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 32.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4.0.h),
                    child: Text(
                      'How Are You Feeling Today?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 32.w,
                  height: 32.h,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    customBorder: const CircleBorder(),
                    child: Icon(
                      Icons.close,
                      color: AppTheme.buttonBrownDark,
                      size: 24.w,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

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
                SizedBox(height: 8.h),
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
