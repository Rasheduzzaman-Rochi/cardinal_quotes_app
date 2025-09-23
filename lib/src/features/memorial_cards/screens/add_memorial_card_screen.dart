import 'package:flutter/material.dart';
import '../../../constants/app_theme.dart';
import '../../main/screens/main_screen.dart';

class AddMemorialCardScreen extends StatefulWidget {
  const AddMemorialCardScreen({super.key});

  @override
  State<AddMemorialCardScreen> createState() => _AddMemorialCardScreenState();
}

class _AddMemorialCardScreenState extends State<AddMemorialCardScreen> {
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _dodController = TextEditingController();

  bool _isContinueEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateFields);
    _dobController.addListener(_validateFields);
    _dodController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _dodController.dispose();
    super.dispose();
  }

  void _validateFields() {
    final isEnabled =
        _nameController.text.isNotEmpty &&
        _dobController.text.isNotEmpty &&
        _dodController.text.isNotEmpty;
    if (_isContinueEnabled != isEnabled) {
      setState(() {
        _isContinueEnabled = isEnabled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(26.0),
          child: Container(
            padding: const EdgeInsets.all(28.0),
            decoration: BoxDecoration(
              color: colorScheme.background,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPhotoPlaceholder(context),
                const SizedBox(height: 24),
                _buildTextField(hintText: 'Name', controller: _nameController),
                const SizedBox(height: 16),
                _buildTextField(
                  hintText: 'Date Of Birth',
                  controller: _dobController,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  hintText: 'Date Of Death',
                  controller: _dodController,
                ),
                const SizedBox(height: 32),
                _buildActionButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        // TODO: Implement image picker functionality
      },
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.unselectedBorder.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              color: Colors.black.withOpacity(0.6),
              size: 26,
            ),
            const SizedBox(width: 12),
            Text(
              'Add a photo',
              style: TextStyle(
                color: colorScheme.onSurface.withOpacity(0.7),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppTheme.buttonBrownDark.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.textFieldBorder,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppTheme.textFieldBorder,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: SizedBox(
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
        ),
        const SizedBox(width: 32),
        Expanded(
          child: ElevatedButton(
            onPressed: _isContinueEnabled
                ? () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
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
              elevation: MaterialStateProperty.resolveWith<double>((
                Set<MaterialState> states,
              ) {
                if (states.contains(MaterialState.disabled)) {
                  return 0;
                }
                return 2;
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
