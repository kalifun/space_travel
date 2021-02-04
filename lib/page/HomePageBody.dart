import 'package:flutter/material.dart';
import 'package:space_travel/model/Planet.dart';
import 'package:space_travel/page/Page.dart';


class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PlanetRow(planets[0]);
  }
}
