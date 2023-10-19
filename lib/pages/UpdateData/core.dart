import 'package:flutter/material.dart';
import 'package:pro_state/pages/UpdateData/home.dart';
import 'package:pro_state/pages/UpdateData/update.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  int selectedPage = 0;

  List<Widget> pages = [
    const Home(),
    Update(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (int newPage) {
          setState(() {
            selectedPage = newPage;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "Update",
          ),
        ],
      ),
      body: pages[selectedPage],
    );
  }
}
