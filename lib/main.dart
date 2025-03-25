
import 'package:flutter/material.dart';
import 'firstpage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
const   MyApp({super.key}) ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

