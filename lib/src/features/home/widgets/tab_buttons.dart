import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          SizedBox(width: 21.w),
          _buildTabButton(
            context,
            text: 'Latest',
            iconPath: 'assets/icons/latest.svg',
          ),
          SizedBox(width: 21.w),
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
        height: 24.h,
        width: 24.w,
        colorFilter: ColorFilter.mode(constantColor, BlendMode.srcIn),
      ),
      label: Text(
        text,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: constantColor,
        backgroundColor: colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      ),
    );
  }
}