import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1_nextgenatix/screens/splash_screen.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
