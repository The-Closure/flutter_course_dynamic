import 'package:flutter/material.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // ignore: sized_box_for_whitespace
    return Row(
      children: [
        SizedBox(
          width: screenWidth / 3,
          height: screenHeight,
          child: ListView(
            children: const [
              ListTile(
                title: Text("Mohammad"),
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(
                title: Text("Nabel"),
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(
                title: Text("Ebrahem"),
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(
                title: Text("Sa3ed"),
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: SizedBox(
            child: Text("Content Chat"),
          ),
        )
      ],
    );
  }
}
