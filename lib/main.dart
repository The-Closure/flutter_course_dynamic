import 'package:flutter/material.dart';
import 'package:responsive_design/common_widgets_for_responsive.dart';
import 'package:responsive_design/layout_builder_example.dart';
import 'package:responsive_design/media_query_example.dart';
import 'package:responsive_design/orentation_example.dart';
import 'package:responsive_design/pages/desktop_layout.dart';
import 'package:responsive_design/pages/mobileLayout.dart';
import 'package:responsive_design/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CommonWidgtsForResponsive(),
    );
  }
}
