import 'package:flutter/material.dart';

class CommonWidgtsForResponsive extends StatefulWidget {
  const CommonWidgtsForResponsive({super.key});

  @override
  State<CommonWidgtsForResponsive> createState() =>
      _CommonWidgtsForResponsiveState();
}

class _CommonWidgtsForResponsiveState extends State<CommonWidgtsForResponsive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 400,
        color: Colors.red,
        child: FittedBox(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 100,
            height: 600,
            color: Colors.blue,
            child: const Center(child: Text("Flutter Logo")),
          ),
        ),
      ),
    );
  }

  Padding FracSizedBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FractionallySizedBox(
        widthFactor: 0.25,
        heightFactor: 0.5,
        child: ElevatedButton(onPressed: () {}, child: const Text("Press Me")),
      ),
    );
  }

  Row expandedAndSpacer() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.yellow,
          ),
        ),
        Expanded(
          flex: 3,
          child: AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(color: Colors.purple),
          ),
        ),
      ],
    );
  }
}
