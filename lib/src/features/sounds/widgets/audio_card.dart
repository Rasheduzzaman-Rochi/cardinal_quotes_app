import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_theme.dart';

class AudioCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String tags;
  final bool isSavedScreen;

  const AudioCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.tags,
    this.isSavedScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primary,
      elevation: 0,
      margin: EdgeInsets.only(bottom: 33.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImagePlayer(context),
          SizedBox(height: 13.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Music: $title',
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  tags,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ),
          if (isSavedScreen)
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.0.h),
              color: const Color(0xFFFF522F),
              child: _buildRemoveActionRow(context),
            )
          else
            _buildSaveActionRow(context),
        ],
      ),
    );
  }

  Widget _buildImagePlayer(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            width: 190.w,
            height: 180.h,
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 12.h,
              bottom: 4.h,
            ),
            decoration: BoxDecoration(
              color: colorScheme.background,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(64),
                  blurRadius: 10.r,
                  spreadRadius: 2.r,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 100.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/sound_wave.svg',
                        height: 110.h,
                        color: colorScheme.background,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: colorScheme.onSurface,
                      size: 32.w,
                    ),
                    Text(
                      '10.00',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox.shrink(),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4.0.h,
                    trackShape: const RoundedRectSliderTrackShape(),
                    activeTrackColor: AppTheme.buttonBrownDark,
                    inactiveTrackColor: AppTheme.buttonBrownDark.withOpacity(
                      0.3,
                    ),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0.0,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 0.0,
                    ),
                  ),
                  child: Slider(value: 1, onChanged: (value) {}),
                ),
                SizedBox(height: 2.h),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.sp,
                    color: colorScheme.onSurface,
                    shadows: [
                      Shadow(
                        color: colorScheme.onSurface.withAlpha(38),
                        offset: const Offset(1, 1),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveActionRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionIcon(context, icon: Icons.remove_red_eye, text: '567.57k'),
        _buildActionIcon(context, icon: Icons.share, text: 'Share'),
        _buildActionIcon(context, icon: Icons.download, text: 'Download'),
        _buildActionIcon(context, icon: Icons.bookmark, text: 'Save'),
      ],
    );
  }

  Widget _buildRemoveActionRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionIcon(context, icon: Icons.remove_red_eye, text: '567.57k'),
        _buildActionIcon(context, icon: Icons.share, text: 'Share'),
        _buildActionIcon(context, icon: Icons.download, text: 'Download'),
        _buildActionIcon(context, icon: Icons.bookmark, text: 'Remove'),
      ],
    );
  }

  Widget _buildActionIcon(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    final iconColor = Colors.white;
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            color: iconColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
