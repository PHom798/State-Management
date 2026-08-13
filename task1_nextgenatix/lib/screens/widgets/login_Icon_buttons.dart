import 'package:flutter/material.dart';

class LoginIconButtons extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final String text;
  const LoginIconButtons({super.key, required this.onTap, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffE2E8F0))
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 2,),
            Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,)),
          ],
        ),
      ),
    );
  }
}
