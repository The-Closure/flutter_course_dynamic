import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Skip",
              style: TextStyle(color: Color(0xFF8BA8B5)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text("New Item"),
              subtitle: Text("New deskjadklsad"),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text("New Item"),
              subtitle: Text("New deskjadklsad"),
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text("New Item"),
              subtitle: Text("New deskjadklsad"),
              trailing: Icon(Icons.add),
            ),
            Align(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Icon(
                      Icons.apple,
                      color: Colors.black,
                      size: 240,
                    ))),
            Align(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Text(
                    "Hello world",
                    style: TextStyle(fontSize: 24),
                  )),
            ),
            Align(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Container(
                    height: 80,
                    child: Column(
                      children: [
                        Text("lorem lorem lorem lorem lorem lorem lorem "),
                        Text("lorem lorem lorem lorem lorem "),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                width: 317,
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF8BA8B5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
