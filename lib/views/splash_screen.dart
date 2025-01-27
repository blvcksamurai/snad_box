import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:snad_box/routes/custom_bottom_nav_bar.dart';
import 'package:snad_box/views/pages/home_screen.dart';
import 'package:snad_box/views/onboarding/onboarding_screen.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/showcase.json'),
      splashIconSize: 400,
      nextScreen: const OnboardingScreen(),
    );
  }
}
