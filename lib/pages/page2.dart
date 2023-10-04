import 'package:flutter/material.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/calender.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/home.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/location.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/profile.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int _selectedPage = 0;
  List<Widget> pages = [
    // const Profile(),
    const Home(),
    const Calender(),
    const Location(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.amberAccent,
        // // fixedColor: Colors.green,
        // selectedItemColor: Colors.red,
        // unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(
            () {
              _selectedPage = value;
            },
          );
        },
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person,
            ),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Calender",
            icon: Icon(
              Icons.calendar_view_day_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "Map",
            icon: Icon(
              Icons.location_city_outlined,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.purple,
      body: pages[_selectedPage],
    );
  }
}
