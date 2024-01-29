import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/themes/theme.dart';
import 'package:meditation_app_ui/features/intro/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation App',
      debugShowCheckedModeBanner: false,
      theme: getThemeData(context, isDark: true),
      home: const SplashScreen(),
    );
  }
}
