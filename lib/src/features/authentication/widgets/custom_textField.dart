import 'package:flutter/material.dart';
import '../../../constants/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: colorScheme.onSurface.withValues(alpha:0.8)),
        suffixIcon: widget.isPassword
            ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                        icon: Icon(
              _isObscured
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppTheme.buttonBrown,
                        ),
                        onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
                        },
                      ),
            )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppTheme.textFieldBorder,
            width: 1.5,
          ), // Using theme color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppTheme.textFieldBorder,
            width: 1.5,
          ), // Using theme color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}