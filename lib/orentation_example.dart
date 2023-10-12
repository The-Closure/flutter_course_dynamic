import 'package:flutter/material.dart';

class OrentationExample extends StatefulWidget {
  const OrentationExample({super.key});

  @override
  State<OrentationExample> createState() => _OrentationExampleState();
}

class _OrentationExampleState extends State<OrentationExample> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return SizedBox(
              width: screenWidth,
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
            );
          } else {
            return SizedBox(
              width: screenWidth,
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
            );
          }
        },
      ),
    );
  }
}
