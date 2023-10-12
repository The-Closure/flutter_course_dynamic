import 'package:flutter/material.dart';

class MediaQueryExapmle extends StatefulWidget {
  const MediaQueryExapmle({super.key});

  @override
  State<MediaQueryExapmle> createState() => _MediaQueryExapmleState();
}

class _MediaQueryExapmleState extends State<MediaQueryExapmle> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Orientation currentOrentation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: screenWidth < 720
          ? Colors.red
          : screenWidth >= 1024
              ? Colors.green
              : Colors.blue,
      body: Container(
        color: Colors.red,
        width: screenWidth,
        height: screenHeight,
        child: Center(
          child: Container(
            color: Colors.yellow,
            width: screenWidth / 2,
            height: screenHeight / 2,
          ),
        ),
      ),
      // body: Center(
      //   child: Text(
      //     "$screenWidth, $screenHeight ,$currentOrentation",
      //     style: const TextStyle(
      //       fontSize: 25,
      //     ),
      //   ),
      // ),
    );
  }
}
