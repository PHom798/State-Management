import 'package:flutter/material.dart';
import 'package:practice_riverpod/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/providers/stream_provider.dart';
import 'package:practice_riverpod/providers/theme_provider.dart';
import 'package:practice_riverpod/theme_screen.dart';

void main(){
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeModeProvider);
    return MaterialApp(
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home:const TimerScreen(),
    );
  }
}

//
// This is the standard Riverpod architecture you'll use repeatedly:
//
// Model → Represents data.
// Service → Fetches or saves data.
// Provider → Exposes the service and its data to the UI.
// UI → Watches providers and rebuilds automatically when the provider's state changes.