import 'package:flutter/material.dart';
import 'package:task1_nextgenatix/screens/login_screen.dart';
import 'package:task1_nextgenatix/screens/widgets/continue_with_line.dart'
    hide continueWith_line;
import 'package:task1_nextgenatix/screens/widgets/custom_textfield.dart';
import 'package:task1_nextgenatix/screens/widgets/login_Icon_buttons.dart';
import 'package:task1_nextgenatix/screens/widgets/signup_link.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Color(0xff171827),
                  ),
                ),
                const SizedBox(height: 12),

                const Text(
                  'Join us and get things done today',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Color(0xff77798A),
                  ),
                ),
                const SizedBox(height: 40),

                AppTextField(
                  hintText: "Full Name",
                  prefixIcon: Icons.person_outline,
                  isPassword: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppTextField(
                  hintText: "Email Address",
                  prefixIcon: Icons.email_outlined,
                  isPassword: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                AppTextField(
                  controll: _passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.password_outlined,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                AppTextField(
                  isPassword: true,
                  hintText: 'Confirm Password',
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }

                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                  ),
                ),

                const SizedBox(height: 20),
                const continueWith_line(),
                const SizedBox(height: 30),
                // Reusable Login options with google and apple
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginIconButtons(
                      onTap: () {},
                      icon: const Icon(Icons.g_mobiledata_outlined, size: 35),
                      text: 'Google',
                    ),

                    const SizedBox(width: 12),
                    LoginIconButtons(
                      onTap: () {},
                      icon: const Icon(Icons.apple_outlined, size: 35),
                      text: 'Apple',
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignupLink(
                      text1: "Have an account? ",
                      text2: 'Sign In',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
