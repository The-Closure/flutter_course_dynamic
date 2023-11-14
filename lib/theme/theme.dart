import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryTextTheme: const TextTheme(
    headlineSmall: TextStyle(
      color: Colors.red,
      fontSize: 20,
    ),
  ),
  primarySwatch: Colors.brown,
  appBarTheme: const AppBarTheme(
    color: Colors.purple,
  ),
  cardColor: Colors.green,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryTextTheme: const TextTheme(
      headlineSmall: TextStyle(
    color: Colors.blue,
    fontSize: 20,
  )),
  primaryColor: Colors.purple,
  primarySwatch: Colors.blue,
  cardColor: Colors.orange,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
  ),
  colorScheme: ColorScheme.dark(
    background: Colors.green,
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade800,
  ),
);
