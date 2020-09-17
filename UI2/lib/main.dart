import 'botton.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'deneme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SignIn(), // Bottom(),
    );
  }
}
