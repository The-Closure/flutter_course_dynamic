import 'package:flutter/material.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/page3.dart';

import 'page1.dart';
import 'page2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController(
    initialPage: 2,
    viewportFraction: 5,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: PageView(
        onPageChanged: (value) => print(value),
        controller: _controller,
        reverse: true,
        scrollDirection: Axis.vertical,
        children: const [
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
    );
  }
}
