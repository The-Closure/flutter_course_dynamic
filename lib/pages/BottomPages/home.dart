import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Home Page',
            ),
            MaterialButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    action: SnackBarAction(label: "Undo", onPressed: () {}),
                    content: const Text("I am SnackBar"),
                  ),
                );
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text("Show SnackBar"),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(50),
              width: 200,
              height: 200,
              color: Colors.red,
              child: const Text("data"),
            )
          ],
        ),
      ),
    );
  }
}
