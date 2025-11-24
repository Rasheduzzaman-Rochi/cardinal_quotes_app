import 'package:cardinal_quotes_app/src/features/main/screens/main_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_theme.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_textfield.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for email and password
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateInputs() {
    final isFormValid =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    if (_isButtonEnabled != isFormValid) {
      setState(() {
        _isButtonEnabled = isFormValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/signupPic.png',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: -25,
              right: -25,
              width: 263,
              height: 263,
              child: Image.asset('assets/images/signupBird.png'),
            ),
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              children: [
                const SizedBox(height: 220),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthButton(text: 'Sign Up', isSelected: false, onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    }),
                    const SizedBox(width: 65),
                    AuthButton(text: 'Log In', isSelected: true, onPressed: () {
                      // Already on this screen, do nothing
                    }),
                  ],
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter your email address',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Enter Password',
                  isPassword: true,
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 95,
                    child: ElevatedButton(
                      onPressed: _isButtonEnabled
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.buttonBrownDark,
                        disabledBackgroundColor: AppTheme.buttonBrownDark
                            .withAlpha(128),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: colorScheme.onPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 200),
              ],
            ),
          ],
        ),
      ),
    );
  }
}