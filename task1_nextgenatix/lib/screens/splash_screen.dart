import 'package:flutter/material.dart';
import 'package:task1_nextgenatix/core/app_colors.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //animation controllers
  late AnimationController _controller;
  late Animation<double> _logoOpacity;
  late Animation<double> _logoScale;

  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _logoScale = Tween<double>(begin: 0.8, end: 1).animate(_controller);

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    final textAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.25, 1, curve: Curves.easeOut),
    );

    _textOpacity = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(curvedAnimation);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 800),
            pageBuilder: (context, animation, secondaryAnimation) {
              return  LoginScreen();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      //backgroundColor: Color(0xFF5B5FEF),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 2),
            ScaleTransition(
              scale: _logoScale,
              child: FadeTransition(
                opacity: _logoOpacity,
                child: Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary,
                  ),
                  child: Icon(
                    Icons.task_alt,
                    size: 40,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            FadeTransition(
              opacity: _textOpacity,
              child: SlideTransition(
                position: _textSlide,
                child: Text(
                  "TaskFlow",
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 30,
                    fontFamily: 'Fraunces',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            FadeTransition(
              opacity: _textOpacity,
              child: SlideTransition(
                position: _textSlide,
                child: Text(
                  "Get things done\nsimply",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),

            CircularProgressIndicator(),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
