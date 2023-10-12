import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatefulWidget {
  const LayoutBuilderExample({super.key});

  @override
  State<LayoutBuilderExample> createState() => _LayoutBuilderExampleState();
}

class _LayoutBuilderExampleState extends State<LayoutBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraits) {
        if (constraits.maxWidth < 720) {
          return const Center(
            child: Text("Mobile"),
          );
        } else if (constraits.maxWidth >= 720 && constraits.maxWidth < 1024) {
          return const Center(
            child: Text("Tablet"),
          );
        } else {
          return const Center(
            child: Text("Desktop"),
          );
        }
      }),
    );
  }
}
