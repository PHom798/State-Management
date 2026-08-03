import 'package:flutter/material.dart';
import 'package:practice_riverpod/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
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