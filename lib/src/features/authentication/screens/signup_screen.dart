import 'package:flutter/material.dart';
import '../../../constants/app_theme.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_textfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers to listen to text field changes
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to all controllers
    _usernameController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
    _confirmPasswordController.addListener(_validateInputs);
    _emailController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _validateInputs() {
    // Check if all text fields are not empty
    final isFormValid =
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty;
    // Update the state only if it has changed
    if (_isButtonEnabled != isFormValid) {
      setState(() {
        _isButtonEnabled = isFormValid;
      });
    }
  }

  bool _isSignUpSelected = true;

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
                    AuthButton(
                      text: 'Sign Up',
                      isSelected: _isSignUpSelected,
                      onPressed: () {
                        setState(() => _isSignUpSelected = true);
                      },
                    ),
                    const SizedBox(width: 65),
                    AuthButton(
                      text: 'Log In',
                      isSelected: !_isSignUpSelected,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                CustomTextField(
                  controller: _usernameController,
                  hintText: 'Enter your username',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Create A Password',
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Enter your email address',
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
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppTheme.buttonBrownDark, // Using theme color
                        disabledBackgroundColor: AppTheme.buttonBrownDark
                            .withValues(alpha: 0.5),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: colorScheme.onPrimary, // Using theme color
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