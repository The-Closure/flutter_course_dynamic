import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterLogo(
                  size: 200,
                ),
                Text(
                  "Dashborad Feed",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "dsjhfsalkdhsjkafhdjksahfjkdsahfjkdsalhfjkdsahfjkdsa",
                  style: TextStyle(color: Colors.white),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        child: Scaffold(),
                        color: Colors.red,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                      ),
                      Container(
                        width: 5,
                        height: 5,
                        color: Colors.red,
                      ),
                      Container(width: 5, height: 5),
                      Container(
                        width: 5,
                        height: 5,
                        color: Colors.white,
                      ),
                      Container(width: 5, height: 5),
                      Container(
                        width: 5,
                        height: 5,
                        color: Colors.red,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
