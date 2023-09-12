import 'package:color_and_decorate/config/helper_method.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: HexColor.fromHex("#A76362"),
          title: Text("Color and Decoration"),
        ),
        body: Center(
          child: GradinatBoard(title: 'title'),
        ),
      ),
    );
  }
}

class GradinatBoard extends StatelessWidget {
  final String title;
  const GradinatBoard({
    
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(title)),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.purple.shade300),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(30)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // stops: [20,30,50],
          // transform: GradientRotation(21),
          tileMode: TileMode.clamp,
          colors: [
            Color(0x7DF5F5F5),
            Colors.blue,
            Color(0xFF3A2966),
          ],
        ),
        color: Colors.red,
      ),
      width: 300,
      height: 300,
    );
  }
}
