import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snad_box/screens/explore_screen.dart';
import 'package:snad_box/screens/landing/home_screen.dart';
import 'package:snad_box/screens/profile/favourites_screen.dart';
import 'package:snad_box/screens/profile/order_details.dart';
import 'package:snad_box/screens/profile/profile_screen.dart';
import 'package:snad_box/screens/transactionHistory/transaction_history.dart';

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
      home: const TransactionHistoryScreen(),
    );
  }
}
