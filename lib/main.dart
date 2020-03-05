import 'package:flutter/material.dart';
import "package:Memes/views/login.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memes Gallery',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFf6f6f6),
        accentColor: Colors.cyan[600],
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
