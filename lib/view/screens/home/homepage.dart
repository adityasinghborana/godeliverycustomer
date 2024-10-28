// ignore_for_file: prefer_const_constructors prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:godelivery/view/screens/home/homescreen.dart';
import 'package:godelivery/view/screens/profile/profilepage.dart';
import '../favoritesshop/favoritesshop.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationWidget()
    );
  }
}



class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Homescreen(),
          favoritesshop(),
          Container(color: Colors.green), // Categories Screen
          Container(color: Colors.green), // Notifications Screen
          Profilepage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 95, 95, 95),
              blurRadius: 20.0,
              spreadRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          iconSize: 20,
          selectedIconTheme: IconThemeData(size: 30),
          fixedColor: Color(0xffBF1D2D),
          unselectedItemColor: Color.fromARGB(255, 46, 46, 46),
          elevation: 2,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Favorite', icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(label: 'Categories', icon: Icon(Icons.square_rounded)),
            BottomNavigationBarItem(label: 'Notifications', icon: Icon(Icons.notifications)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person_outline)),
          ],
        ),
      ),
    );
  }
}