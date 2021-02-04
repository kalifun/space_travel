import 'package:flutter/material.dart';
import 'package:space_travel/page/Page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          new GradienAppBar("Space Travel"),
          new HomePageBody(),
          new HomePageBody()
        ],
      ),
    );
  }
}