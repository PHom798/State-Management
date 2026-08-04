import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/providers/theme_provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theme Switcher"),

      ),
      body: Row(
        children: [
          const Text("Dark Mode"),
          const SizedBox(width: 10),
         Consumer(builder: (ctx,ref,child){
           final isDarkMode = ref.watch(themeModeProvider);
           return Switch(value: isDarkMode, onChanged: (value){
             ref.read(themeModeProvider.notifier).toggle();
           });
         })
        ],
      ),
    );
  }
}
