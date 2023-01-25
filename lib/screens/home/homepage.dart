import 'package:flutter/material.dart';
import 'package:bottom_navigation_view/bottom_navigation_view.dart';
import 'package:godelivery/screens/home/homescreen.dart';
import 'package:godelivery/screens/profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final BottomNavigationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = BottomNavigationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationView(
        controller: _controller,
        transitionType: BottomNavigationTransitionType.fadeInOut,
        backgroundColor: Colors.lime,
        children: <Widget>[
          Homescreen(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.green,
          ),
          Profilepage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationIndexedBuilder(
        controller: _controller,
        builder: (context, index, child) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 95, 95, 95),
                blurRadius: 20.0,
                spreadRadius: 10,
              ),
            ]),
            child: BottomNavigationBar(
              iconSize: 20,
              selectedIconTheme: IconThemeData(size: 30),
              fixedColor: Color(0xffBF1D2D),
              unselectedItemColor: Color.fromARGB(255, 46, 46, 46),
              elevation: 2,
              currentIndex: index,
              onTap: (index) {
                _controller.goTo(index);
              },
              type: BottomNavigationBarType.shifting,
              items: const [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: 'Favorite', icon: Icon(Icons.favorite)),
                BottomNavigationBarItem(
                    label: 'Categories', icon: Icon(Icons.square_rounded)),
                BottomNavigationBarItem(
                    label: 'Notifications',
                    icon: Icon(
                      Icons.notifications,
                    )),
                BottomNavigationBarItem(
                    label: 'Profile', icon: Icon(Icons.person_outline)),
              ],
            ),
          );
        },
      ),
    );
  }
}
