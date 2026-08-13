import 'package:flutter/material.dart';
import 'package:task1_nextgenatix/core/app_colors.dart';
import 'package:task1_nextgenatix/screens/home_screen.dart';
import 'package:task1_nextgenatix/screens/signup_screen.dart';
import 'package:task1_nextgenatix/screens/widgets/custom_textfield.dart';
import 'package:task1_nextgenatix/screens/widgets/login_Icon_buttons.dart';
import 'package:task1_nextgenatix/screens/widgets/signup_link.dart';

class LoginScreen extends StatefulWidget {

   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
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
              child: Form(
                key: _formKey,
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
                      isPassword: false,
                      hintText: 'Email Address',
                      prefixIcon: Icons.email_outlined,
                      validator: (value){
                        if(value == null || value.trim().isEmpty){
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Password Field
                    AppTextField(
                      isPassword: true,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      suffixIcon:Icons.visibility_off_outlined,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Password is required';
                        }
                        if(value.length<6){
                          return 'Password must be at least 6 character';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 5),
                    //For forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text(
                          "Forgot password ?",
                          style: TextStyle(color: AppColors.primaryLight),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity, //Makes button span full width
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _isLoading? null: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            await Future.delayed(
                              const Duration(seconds: 2),
                              await Navigator.pushReplacement(context,MaterialPageRoute(builder: ((context) => HomeScreen())))
                            );

                            if(!mounted) return;

                            setState(() {
                              _isLoading = false;
                            });
                          }
                        },
                        child: _isLoading ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ):const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    continueWith_line(),
                    const SizedBox(height: 40),
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
                    //To naviage to signup screen
                    const SizedBox(height: 52),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [ SignupLink(text1:
                          "Don't have an account? ", text2: 'Sign Up', onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> SignupScreen()));

                        },)]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class continueWith_line extends StatelessWidget {
  const continueWith_line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text(
          'or continue with',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(
              0xff77798A,
            ), // Matches subtitle color
          ),
        ),

        const Expanded(
          child: Divider(
            indent: 16,
            color: Color(0xffE2E8F0),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
