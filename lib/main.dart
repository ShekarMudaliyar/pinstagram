import 'package:flutter/material.dart';
import 'package:pinstagram/homepage.dart';
import 'package:pinstagram/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinstagram',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
