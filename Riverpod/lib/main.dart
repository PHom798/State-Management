import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/future_provider_screen.dart';
import 'package:riverpod_demo/item_screen.dart';
import 'package:riverpod_demo/item_screen_latest.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:FutureProviderScreen(),
      ),
    );
  }
}
