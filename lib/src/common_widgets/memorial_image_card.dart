import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemorialImageCard extends StatelessWidget {
  final String imagePath;
  final String tags;

  const MemorialImageCard({
    super.key,
    required this.imagePath,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.only(bottom: 33.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200.h,
                  color: Colors.grey,
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tags,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                _buildActionRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
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

  Widget _buildActionIcon(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    final iconColor = Colors.white;
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20.w),
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
