import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  int x = 3;
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: getStreamOfData(1000),
          builder: (context, snapshot) {
            return Stack(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
                Transform.rotate(
                  angle: pi / snapshot.data,
                  child: Container(
                    width: 20,
                    height: 200,
                    color: Colors.red,
                  ),
                ),
              ],
            );
          },
        ),

        // ! How to Fetch Data from a Function
        // child: FutureBuilder(
        //   future: getData(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Text(snapshot.data.toString());
        //     } else if (snapshot.connectionState == ConnectionState.waiting){
        //       return CircularProgressIndicator();
        //     }
        //     else {
        //       return Text("Error in Fetching Data");
        //     }
        //   },
        // ),

        // ? Form Responsive Design
        // child: LayoutBuilder(
        //   builder: (context, constraints) {
        //     if (constraints.maxWidth > 600) {
        //       return Row(
        //         children: [
        //           FlutterLogo(),
        //           Container(
        //             width: 300,
        //             height: 300,
        //             color: Colors.red,
        //           )
        //         ],
        //       );
        //     } else {
        //       return Container(
        //         color: Colors.blue,
        //       );
        //     }
        //   },
        // ),

        // child: Builder(
        //   builder: (context) {
        //     if(age > 20){

        //     return CircularProgressIndicator();
        //     }
        //     else {
        //       return FlutterLogo();
        //     }
        //   }
        // ),
      ),
    );
  }
}

Future getData() async {
  int x = 6;
  await Future.delayed(
    Duration(seconds: 3),
    () {},
  );
  return x = x + 6;
}

Stream getStreamOfData(int Max) async* {
  for (var i = 1; i < Max; i++) {
    await Future.delayed(
      Duration(seconds: 1),
    );
    yield i;
  }
}
