import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index) {
        return Dismissible(
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              print("Call");
            } else {
              print("Message");
            }
          },
          // direction: DismissDirection.startToEnd,
          background: Container(
            color: Colors.red,
            child: Row(
              children: [
                Icon(Icons.delete),
              ],
            ),
          ),
          key: GlobalKey(),
          child: CheckboxListTile(
controlAffinity: ListTileControlAffinity.leading,
            value: value,
            onChanged: (val) {
              setState(() {
                value = val!;
              });
            },
            title: Text("Hello Man"),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.small(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ));
        },
      ),
    );
  }
}

bool value = false;

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

double height = 400;
int counter = 0;

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                  print('I am an Elevated button');
                  print(counter);
                },
                child: Text("press me")),
          ),
          Checkbox(
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val!;
                });
              }),
          OutlinedButton(
              onPressed: () {
                setState(() {
                  height = 400;
                });
                print('I am an Outlined button');
              },
              child: Text("press me")),
          TextButton(
            onPressed: () {
              setState(() {
                height = 200;
              });
              print('I am an Text button');
            },
            child: Text("press me"),
          ),
          Hero(
            tag: 'animation',
            child: InkWell(
              onTap: (){
                print("object");
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 3),
                child: Center(
                  child: Text(
                    counter.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                height: height,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   Navigator.pop(context);
      // }),
    );
  }
}
