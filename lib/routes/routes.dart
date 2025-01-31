import 'package:flutter/material.dart';
import 'package:snad_box/views/createAccount/step1.dart';
import 'package:snad_box/views/createAccount/step2.dart';
import 'package:snad_box/views/createAccount/step3.dart';
import 'package:snad_box/views/onboarding/onboarding_screen.dart';
import 'package:snad_box/views/otp/otp_screen.dart';
import 'package:snad_box/views/landing_view.dart';
import 'package:snad_box/views/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String onboarding = '/onboarding';
  static const String stepOne = '/stepOne';
  static const String stepTwo = '/stepTwo';
  static const String stepThree = '/stepThree';
  static const String otpScreen = '/otp';
  static const String landingView = '/landingView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const CustomSplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case stepOne:
        return MaterialPageRoute(builder: (_) => const StepOne());
      case stepTwo:
        return MaterialPageRoute(builder: (_) => const StepTwo());
      case stepThree:
        return MaterialPageRoute(builder: (_) => const StepThree());
      case otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case landingView:
        return MaterialPageRoute(builder: (_) => const CustomLandingView());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page Not Found')),
          ),
        );
    }
  }
}
