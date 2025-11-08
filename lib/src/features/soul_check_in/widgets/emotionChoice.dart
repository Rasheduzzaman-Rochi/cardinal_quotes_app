import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/share_something_dialog.dart';

class EmotionChoice extends StatelessWidget {
  final IconData? icon;
  final String text;

  const EmotionChoice({super.key, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          barrierColor: Theme.of(context).colorScheme.primary,
          builder: (context) => const ShareSomethingDialog(),
        );
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 4.0.w),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 20.w,
                ),
                SizedBox(width: 6.w),
              ],
              Text(
                text,
                textAlign: icon == null ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
