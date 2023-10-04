import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "1",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text("Go to The next"),
              )
            ],
          ),
        ));
  }
}
