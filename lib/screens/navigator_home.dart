import 'package:coffy/screens/chart.dart';
import 'package:coffy/screens/favorites.dart';
import 'package:coffy/screens/home.dart';
import 'package:coffy/screens/notification.dart';
import 'package:flutter/material.dart';

class NavigatorHome extends StatefulWidget {
  const NavigatorHome({super.key});

  @override
  State<NavigatorHome> createState() => _NavigatorHomeState();
}

class _NavigatorHomeState extends State<NavigatorHome> {
  
  List<Widget> myscreens = [
    const HomePage(),
    const CartPage(),
    const FavoritesPage(),
    const Notifications()
  ];

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 240, 150, 91),
        onTap: (value) {
          setState(() {
            current = value;
          });
        },
        currentIndex: current,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 32), label: '.'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp, size: 32), label: '.'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp, size: 32), label: '.'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_on_rounded, size: 32), label: '.'),
        ],
      ),
      body: myscreens[current],
    );
  }
}
