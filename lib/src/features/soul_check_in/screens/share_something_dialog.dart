import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_theme.dart';

class ShareSomethingDialog extends StatefulWidget {
  const ShareSomethingDialog({super.key});

  @override
  State<ShareSomethingDialog> createState() => _ShareSomethingDialogState();
}

class _ShareSomethingDialogState extends State<ShareSomethingDialog> {
  final _textController = TextEditingController();
  bool _isContinueEnabled = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      final isEnabled = _textController.text.isNotEmpty;
      if (_isContinueEnabled != isEnabled) {
        setState(() {
          _isContinueEnabled = isEnabled;
        });
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w,top: 22.h, bottom: 7.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  Text(
                    'Share something with us.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17.sp,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  _buildTextBox(context),
                  SizedBox(height: 9.h),
                  _buildActionButtons(context),
                ],
              ),
            ),
            Positioned(
              top: 9.h,
              right: 6.w,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                customBorder: const CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Icon(
                    Icons.close,
                    color: AppTheme.buttonBrownDark,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextBox(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: TextFormField(
        controller: _textController,
        expands: true,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: 'I',
          contentPadding: EdgeInsets.all(10.w),
          filled: true,
          fillColor: AppTheme.backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        SizedBox(
          width: 90.w,
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              side: BorderSide(
                color: AppTheme.unselectedBorder,
                width: 1.3.w,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 43.w),
        Expanded(
          child: ElevatedButton(
            onPressed: _isContinueEnabled
                ? () {
              // TODO: Implement continue logic for sharing text
              Navigator.of(context).pop();
            }
                : null,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 12.h),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                  ) {
                if (states.contains(MaterialState.disabled)) {
                  return AppTheme.buttonBrown.withAlpha(128);
                }
                return AppTheme.buttonBrownDark;
              }),
              foregroundColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                  ) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.white.withAlpha(179);
                }
                return Colors.white;
              }),
            ),
            child: Text(
              'Continue',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          ),
        ),
      ],
    );
  }
}
