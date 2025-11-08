import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'memorial_image_card.dart';

class ContentListScreen extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final VoidCallback? onBackTapped;

  const ContentListScreen({
    super.key,
    required this.title,
    required this.items,
    this.onBackTapped,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 2.h),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: colorScheme.onPrimary,
                    size: 35.w,
                  ),
                  onPressed: onBackTapped ?? () => Navigator.of(context).pop(),
                ),
                SizedBox(width: 5.w),
                Text(
                  title,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(
          left: 21.0.w,
          right: 21.0.w,
          top: 12.h,
          bottom: 10.0.h,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return MemorialImageCard(
            imagePath: item['imagePath']!,
            tags: item['tags']!,
          );
        },
      ),
    );
  }
}
