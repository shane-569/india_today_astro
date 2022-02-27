import 'package:flutter/material.dart';
import 'package:india_today_astro/views/home_screen.dart';

class MottomNavigation extends StatefulWidget {
  const MottomNavigation({Key? key}) : super(key: key);

  @override
  _MottomNavigationState createState() => _MottomNavigationState();
}

class _MottomNavigationState extends State<MottomNavigation> {
  final List _screens = [
    // ignore: prefer_const_constructors
    HomeScreenView(),
    // ignore: prefer_const_constructors
    HomeScreenView(),
    // ignore: prefer_const_constructors
    HomeScreenView(),
    // ignore: prefer_const_constructors
    HomeScreenView(),
    // ignore: prefer_const_constructors
    HomeScreenView()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [
          Icons.home,
          Icons.search,
          Icons.qr_code,
          Icons.card_travel,
          Icons.person,
        ]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: "",
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.red
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
