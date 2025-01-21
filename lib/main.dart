import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snad_box/routes/custom_bottom_nav_bar.dart';
import 'package:snad_box/views/explore_screen.dart';
import 'package:snad_box/views/landing/home_screen.dart';
import 'package:snad_box/views/profile/favourites_screen.dart';
import 'package:snad_box/views/profile/order_details.dart';
import 'package:snad_box/views/profile/profile_screen.dart';
import 'package:snad_box/views/transactionHistory/transaction_history.dart';

import 'views/splash_screen.dart';

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
      home: const CustomBottomNavBar(),
      // home: const TransactionHistoryScreen(),
    );
  }
}
