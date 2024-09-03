import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medicalstoreapp/src/screens/cart_screen.dart';
import 'package:medicalstoreapp/src/screens/home_screen.dart';
import 'package:medicalstoreapp/src/screens/notifications.dart';
import 'package:medicalstoreapp/src/screens/profile_screen.dart';

class NavigationToggle extends StatefulWidget {
  const NavigationToggle({super.key});

  @override
  State<NavigationToggle> createState() => _NavigationToggleState();
}

class _NavigationToggleState extends State<NavigationToggle> {
  int _selectedIndex = 0;

  navigateBotomBar(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    const HomeScreen(),
    const NotificationScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
          backgroundColor: const Color(0xff4157FF),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: const Color(0xff4157FF).withOpacity(0.3),
          gap: 8,
          onTabChange: (index) {
            navigateBotomBar(index);
          },
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.notifications_outlined,
              text: 'Notifications',
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.person_outline,
              text: 'Profile',
            ),
          ]),
    );
  }
}
