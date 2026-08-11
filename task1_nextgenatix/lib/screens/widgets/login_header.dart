import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
   final String text;
   final TextStyle style;

  const LoginHeader({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,style: style,

      ),
    );
  }
}
