import 'package:flutter/material.dart';
import 'package:osos_test/presentation/app_theme.dart';
import 'package:osos_test/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: AppTheme.lightBlue, elevation: 0.0)),
      home: const SplashScreen(),
    );
  }
}
