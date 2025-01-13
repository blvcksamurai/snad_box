import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snad_box/screens/createAccount/step1.dart';
import 'package:snad_box/screens/createAccount/step2.dart';
import 'package:snad_box/screens/createAccount/step3.dart';
import 'package:snad_box/screens/explore_screen.dart';
import 'package:snad_box/screens/landing/home_screen.dart';
import 'package:snad_box/screens/onboarding/onbarding_screen.dart';
import 'package:snad_box/screens/otp/otp_screen.dart';
import 'package:snad_box/screens/products/product_description.dart';
import 'package:snad_box/screens/profile/profile_screen.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      title: 'Snad Box',
      scrollBehavior: const CupertinoScrollBehavior(),
      theme: ThemeData(
        fontFamily: 'Gsa',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const CustomSplashScreen(),
      home: const ProfileScreen(),
    );
  }
}
