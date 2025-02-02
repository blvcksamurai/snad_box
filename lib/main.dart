import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snad_box/routes/routes.dart';

import 'package:snad_box/utils/constants.dart';

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
          scaffoldBackgroundColor: kBgcolor,
          appBarTheme: const AppBarTheme(
            backgroundColor: kBgcolor,
          )),
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
      // home: const StoreDetailsScreen(),
      // home: const OnboardingScreen(),
      // home: const StepThree(),
    );
  }
}
