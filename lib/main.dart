import 'package:flower_app/core/utils/app_fonts.dart';
import 'package:flower_app/features/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main(   ) {
  runApp(
      const FlowerApp()
  );
}
class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: AppFonts.roboto
      ),
      debugShowCheckedModeBanner: false,
      title: "FlowerApp",
      home: const SplashScreen(),

    );
  }
}