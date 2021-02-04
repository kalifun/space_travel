import 'package:flutter/material.dart';
import 'package:space_travel/page/HomePage.dart';
import 'package:space_travel/page/Page.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: new HomePage(),
    );
  }
}