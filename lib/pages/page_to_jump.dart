import 'package:flutter/material.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/calender.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/home.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/location.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/profile.dart';

class PageToJump extends StatefulWidget {
  const PageToJump({super.key});

  @override
  State<PageToJump> createState() => _PageToJumpState();
}

class _PageToJumpState extends State<PageToJump> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          const Home(),
          const Calender(),
          const Location(),
          Profile(controller: _controller),
        ],
      ),
    );
  }
}
