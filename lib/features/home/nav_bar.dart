import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xbooks_store/features/home/dummy_home_screen.dart';
import 'package:xbooks_store/features/home/view/home_screen.dart';

import '../../core/theming/app_colors.dart';
import '../books/view/Books_screen.dart';
import '../favorite/view/favorite_screen.dart';
import '../profile/view/profile_screen.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _index = 0;
  List<Widget> navigationScreens = [
    const HomeScreen(),
    const BooksScreen(),
    const FavoriteScreen(),
    const DummyHomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationScreens[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        type: BottomNavigationBarType.shifting,
        selectedItemColor: AppColors.teal,
        unselectedItemColor: AppColors.greyTaupe,
        selectedIconTheme: const IconThemeData(color: AppColors.teal),
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
