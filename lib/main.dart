import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["item 1", "item 2"];
  String message = " ";
  int tapDown = 0;
  int tapUp = 0;
  double postionCursreX = 0;
  double postionCursreY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                Future.delayed(const Duration(seconds: 1));
                items.add("item ${items.length + 1}");
                setState(() {});
              },
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: Colors.red,
              width: double.infinity,
              height: 50,
              child: Center(child: Text(message)),
            ),
            NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  setState(() {
                    message = "Scroll Started";
                  });
                } else if (scrollNotification is ScrollUpdateNotification) {
                  setState(() {
                    message = "Scroll Updated";
                  });
                } else if (scrollNotification is ScrollEndNotification) {
                  setState(() {
                    message = "Scroll Ended";
                  });
                }
                return true;
              },
              child: SizedBox(
                height: 300,
                child: ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("item $index"),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 300,
              child: Listener(
                onPointerDown: (details) {
                  setState(() {
                    tapDown++;
                  });
                },
                onPointerMove: (PointerMoveEvent details) {
                  setState(() {
                    postionCursreX = details.position.dx;
                    postionCursreY = details.position.dy;
                  });
                },
                onPointerUp: (details) {
                  setState(() {
                    tapUp++;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      tapUp.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      tapDown.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "X = $postionCursreX  Y = $postionCursreY",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
