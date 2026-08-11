import 'package:flutter/material.dart';
import 'package:task1_nextgenatix/core/app_colors.dart';
import 'package:task1_nextgenatix/core/app_theme.dart';
import 'package:task1_nextgenatix/screens/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context).inputDecorationTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // 1. Prevents crash/overflow when keyboard pops up
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double
                  .infinity, // 2. Forces Column to match screen width for horizontal centering
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // 3. Centers text horizontally
                children: [
                  const SizedBox(
                    height: 60,
                  ), // 4. Fixed safe space from top of the screen
                  // --- HEADER SECTION ---
                  const Text(
                    'Welcome Back👋',
                    style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: Color(0xff171827),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Let's get things done\ntoday",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xff77798A),
                    ),
                  ),

                  const SizedBox(
                    height: 48,
                  ), // 5. Generous gap between headers and forms
                  // --- INPUT FIELDS SECTION ---
                  // Email Field
                  AppTextField(
                    hintText: 'Email Address',
                    prefixIcon: Icons.email_outlined,
                  ),

                  const SizedBox(height: 16),

                  // Password Field
                  AppTextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    obscureText: true,
                    suffixIcon: Icons.visibility_off_outlined,
                  ),

                  const SizedBox(height: 15),
                  //For forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forgot passowrd?',
                          style: TextStyle(
                            color: AppColors.primaryLight,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity, //Makes button span full width
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 7,),

                  Row(
                    children: [
                      //left line
                      const Expanded(
                        child: Divider(
                          color: Color(0xffE2E8F0), //subtle light grey color
                          thickness: 1, //line thickness
                          endIndent: 16, //Gap between the line and text
                        ),
                      ),
                      
                      //Middle text
                      Text('or continue with', style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color:  const Color(0xff77798A), // Matches subtitle color
                      ),),

                      const Expanded(child: Divider(
                        color:  Color(0xffE2E8F0),
                        thickness: 1,
                        endIndent: 16, //Gap between the line and text
                      ))
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
