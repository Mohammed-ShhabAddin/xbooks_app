import 'package:flutter/material.dart';
import 'package:xbooks_store/features/home/dummy_home_screen.dart';
import 'package:xbooks_store/features/home/view/home_screen.dart';

import '../../core/theming/app_colors.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _index = 0;
  List<Widget> navigationScreens = [
    const HomeScreen(),
    const DummyHomeScreen(),
    const DummyHomeScreen(),
    const DummyHomeScreen(),
    const DummyHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationScreens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        type: BottomNavigationBarType.shifting,
        selectedItemColor: AppColors.blueTurquoise,
        unselectedItemColor: AppColors.greyTaupe,
        selectedIconTheme: const IconThemeData(color: AppColors.blueTurquoise),
        unselectedIconTheme: const IconThemeData(color: AppColors.greyTaupe),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
