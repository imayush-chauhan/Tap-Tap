import 'package:flutter/material.dart';
import 'package:tapntap/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap&Tap',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}