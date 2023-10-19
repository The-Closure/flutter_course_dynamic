import 'package:flutter/material.dart';
import 'package:pro_state/pages/UpdateData/core.dart';
import 'package:pro_state/providers/counter_provider.dart';
import 'package:pro_state/providers/update_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UpdateProvider(),
        )
      ],
      child: const MaterialApp(
        home: Core(),
      ),
    );
  }
}
