import 'package:flutter/material.dart';
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
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24,top: 22, bottom: 7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Share something with us.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 13),
                  _buildTextBox(context),
                  const SizedBox(height: 9),
                  _buildActionButtons(context),
                ],
              ),
            ),
            Positioned(
              top: 9,
              right: 6,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                customBorder: const CircleBorder(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.close,
                    color: AppTheme.buttonBrownDark,
                    size: 24,
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
      height: 180,
      child: TextFormField(
        controller: _textController,
        expands: true,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: 'I',
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          fillColor: AppTheme.textFieldBorder.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
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
          width: 90,
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: const BorderSide(
                color: AppTheme.unselectedBorder,
                width: 1.3,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 43),
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
                const EdgeInsets.symmetric(vertical: 12),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                  ) {
                if (states.contains(MaterialState.disabled)) {
                  return AppTheme.buttonBrown.withOpacity(0.5);
                }
                return AppTheme.buttonBrownDark;
              }),
              foregroundColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                  ) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.white.withOpacity(0.7);
                }
                return Colors.white;
              }),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
