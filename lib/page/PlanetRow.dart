import 'package:flutter/material.dart';
import 'package:space_travel/model/Planet.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
    );

    final headerTextStyle = baseTextStyle.copyWith(
      color: const Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
    );

    final regularTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 9.0,
      fontWeight: FontWeight.w400
    );

    final subHeaderTextStyle = regularTextStyle.copyWith(
        fontSize: 12.0
    );
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: new Stack(
        children: <Widget>[
          _planetCard(),
          _planetThumbnail(),
        ],
      ),
    );
  }

  Widget _planetThumbnail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        image: new AssetImage(planet.image),
        height: 92.0,
        width: 92.0,
      ),
    );
  }

  Widget _planetCard() {
    return Container(
      height: 124.0,
      margin: EdgeInsets.only(left: 64.0),
      decoration: new BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            )
          ]),
    );
  }
}
