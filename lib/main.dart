import 'package:exam_app/features/profile/presentation/pages/profile_main.dart';
import 'package:exam_app/features/splash/presentation/pages/splash_page.dart';
import 'package:exam_app/main_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}