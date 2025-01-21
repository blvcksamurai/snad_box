import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/views/cart/cart_screen.dart';
import 'package:snad_box/views/explore_screen.dart';
import 'package:snad_box/views/landing/home_screen.dart';
import 'package:snad_box/views/profile/profile_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentScreen = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    ExploreScreen(),
    CartScreen(),
    Text('Stores'),
    ProfileScreen(),
  ];

  void changeScreen(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
          color: Color(0xff7d7d7d),
          width: 1,
        ))),
        child: BottomNavigationBar(
            currentIndex: currentScreen,
            backgroundColor: kBgcolor,
            onTap: changeScreen,
            elevation: 0,
            showSelectedLabels: true,
            selectedItemColor: Colors.black,
            unselectedItemColor: const Color(0xff7d7d7d),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.discover),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.building),
                label: 'Stores',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_circle),
                label: 'Profile',
              )
            ]),
      ),
    );
  }
}
