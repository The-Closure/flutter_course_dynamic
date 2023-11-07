import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:controller_types/config/extenstion/mixin_widget.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget with AwesomeFlushBar {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showMyToast(context);
            },
            child: Text('Toast')),
      ),
    );
  }
}
