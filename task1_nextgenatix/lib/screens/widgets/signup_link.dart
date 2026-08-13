import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task1_nextgenatix/screens/signup_screen.dart';

class SignupLink extends StatelessWidget {
  final String text1, text2;
  final VoidCallback onTap;
  const SignupLink({super.key, required this.text1, required this.text2, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      //base style for the entire blcok of text
      style: TextStyle(
        fontSize: 15,
        color: Colors.black87
      ),
      children: [
        TextSpan(text: text1),
        TextSpan(
          text: text2,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue
          ),

          //we have to make the specific text fragment clickable so lets use recognizer with taprecognizer
          recognizer: TapGestureRecognizer()
            ..onTap =onTap,
        )
      ]
    ));
  }
}
