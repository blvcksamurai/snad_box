import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/views/pages/cart/cart_screen.dart';
import 'package:snad_box/views/pages/explore/explore_screen.dart';
import 'package:snad_box/views/pages/home/home_screen.dart';
import 'package:snad_box/views/pages/profile/profile_screen.dart';
import 'package:snad_box/views/pages/stores/stores_screen.dart';

import '../utils/constants.dart';

class CustomLandingView extends StatefulWidget {
  const CustomLandingView({super.key});

  @override
  State<CustomLandingView> createState() => _CustomLandingViewState();
}

class _CustomLandingViewState extends State<CustomLandingView> {
  int _selectedIndex = 0;

  // List of pages
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const StoresScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // Maintains state when switching tabs
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
          color: Color(0xff7d7d7d),
          width: 1,
        ))),
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            backgroundColor: kBgcolor,
            onTap: _onItemTapped,
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
