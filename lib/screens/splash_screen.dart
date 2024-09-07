import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coffy/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splash.jpg',
      splashIconSize: 300,
      nextScreen:const LoginScreen(),
      curve: Curves.slowMiddle,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
    );
  }
}