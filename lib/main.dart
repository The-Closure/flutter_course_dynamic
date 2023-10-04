import 'package:flutter/material.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/BottomPages/home.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/page2.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/page_to_jump.dart';

import 'pages/home_page.dart';
import 'pages/page1.dart';
import 'pages/page3.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageToJump(),
    );
  }
}
