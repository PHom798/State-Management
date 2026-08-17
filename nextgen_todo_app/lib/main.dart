import 'package:flutter/material.dart';
import 'package:nextgen_todo_app/features/todo/presentation/screens/todo_screen.dart';

import 'core/theme/app_theme.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: TodoScreen(),

    );
  }
}
