import 'package:flutter/material.dart';
import 'dart:ui'; // needed for ImageFilter

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              Image.asset('assets/img_1.png'),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 8,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.landscape_outlined, color: Color(0xFFffead3)),
                      SizedBox(width: 8),
                      Text(
                        'TravelMate',
                        style: TextStyle(
                          color: Color(0xFFffead3),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'PlayfairDisplay',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.46,
                left: 0,
                right: 0,
                bottom: 0,
                child: LoginCard(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
        child: Container(
          decoration: BoxDecoration(
            // Himalayan mist / frosted stone
            color: Color(0xFFffead3).withValues(alpha: 0.9),

            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),

            // Thin snow-like highlight
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.55),
                width: 1,
              ),
            ),

            // Deep mountain shadow
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF111820).withValues(alpha: 0.28),
                offset: const Offset(0, -12),
                blurRadius: 35,
                spreadRadius: -8,
              ),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 26, 24, 26),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, traveler',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 23,
                    color: const Color(0xFF29241F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'फेरि स्वागत छ, यात्री',
                  style: TextStyle(
                    color: Color(0xFFB5622A),
                    fontSize: 14,
                    fontFamily: 'nepali',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
