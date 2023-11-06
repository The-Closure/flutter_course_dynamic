import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contes) {
    return MaterialApp(home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Icon(Icons.facebook,color: Colors.blue),),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width = 200;
  double height = 200;
  Color color = Colors.red;
  bool magic = true;



    @override
    initState() {
      Future.delayed(Duration(seconds: 4), () {
        print('-------------------');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyWidget(),
            ));
      });
    }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              replacement: FlutterLogo(
                size: 200,
              ),
              visible: magic,
              child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  width: width,
                  height: height,
                  color: color),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (magic) {
                      setState(() {
                        print('object');
                        width = width + 100;
                        height = height + 100;
                        color = Colors.blue;
                        magic = !magic;
                      });
                    } else {
                      setState(() {
                        width = width - 100;
                        height = height - 100;
                        color = Colors.red;
                        magic = !magic;
                      });
                    }
                  },
                  child: Text(magic ? 'zoom in' : 'zoom out')),
            )
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}



