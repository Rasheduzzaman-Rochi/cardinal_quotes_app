import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/app_theme.dart';
import '../../authentication/screens/login_screen.dart';
import '../../memorial_cards/screens/memorial_card_screen.dart';
import '../../save/screens/save_screens.dart';

class HomeDrawer extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  const HomeDrawer({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      width: (screenWidth * 0.6) + 10.w,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: EdgeInsets.only(top: 40.h, bottom: 40.h, left: 20.w),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
              child: Column(
                children: [
                  SizedBox(height: 5.h),
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
                  SizedBox(height: 16.h),
                  Text(
                    '"Peace comes from within.\nDo not seek it without."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 9.h),
                  Text(
                    'Buddha',
                    style: TextStyle(
                      color: colorScheme.onSurface,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          color: AppTheme.buttonBrown,
                          offset: Offset(1.w, 1.h),
                          blurRadius: 2.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/popular.svg',
                    text: 'Popular',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/latest.svg',
                    text: 'Latest',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/cardinal_sounds.svg',
                    text: 'Cardinal Sound',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/wallpaper.svg',
                    text: 'Wallpaper',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/nature_sounds.svg',
                    text: 'Natural Sound',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/sleeping_sounds.svg',
                    text: 'Sleeping',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/meditation.svg',
                    text: 'Meditation',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/short_meditations.svg',
                    text: 'Short Meditation',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/top_quotes.svg',
                    text: 'Top Quotes',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/soul_check_in.svg',
                    text: 'Soul Check-In',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/sacred_journals.svg',
                    text: 'Sacred Journals',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/medicine_notes.svg',
                    text: 'Medicine Note',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/memorial_cards.svg',
                    text: 'Memorial Card',
                  ),
                  _buildDrawerItem(
                    context,
                    colorScheme,
                    iconPath: 'assets/icons/save.svg',
                    text: 'Save',
                  ),
                  SizedBox(height: 16.h),
                  _buildLogoutButton(context, colorScheme),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    ColorScheme colorScheme, {
    required String iconPath,
    required String text,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(vertical: -3),
      leading: SvgPicture.asset(
        iconPath,
        height: 22.h,
        width: 22.w,
        colorFilter: const ColorFilter.mode(
          AppTheme.buttonBrown,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        if (text == 'Memorial Card') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MemorialCardScreen()),
          );
        } else if (text == 'Sleeping') {
          onItemTapped(1);
        } else if (text == 'Save') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SaveScreen()),
          );
        } else if (text == 'Soul Check-In') {
          onItemTapped(2);
        } else if (text == 'Top Quotes') {
          onItemTapped(3);
        }
      },
    );
  }

  Widget _buildLogoutButton(BuildContext context, ColorScheme colorScheme) {
    return InkWell(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log Out',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
                shadows: [
                  Shadow(
                    color: AppTheme.buttonBrown,
                    offset: Offset(1.w, 1.h),
                    blurRadius: 2.r,
                  ),
                ],
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(
              'assets/icons/logout.svg',
              height: 24.h,
              width: 24.w,
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
