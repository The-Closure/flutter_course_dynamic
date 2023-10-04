import 'package:flutter/material.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/page1.dart';
import 'package:pageview_bottomnavigation_drawer_snackbar/pages/page2.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<Widget> pages = [
    const Page2(),
  ];
  final PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 5,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
