import 'package:flutter/material.dart';
import 'package:tcg_tracker/UI/homescreen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homescreen());
  }
}
