import 'package:flutter/material.dart';
import 'package:space_travel/model/Planet.dart';
import 'package:space_travel/model/StyleValue.dart';
import 'package:space_travel/page/Page.dart';

class PlanetRow extends StatelessWidget {
  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder: (_, __, ___) => new DetailPage(planet),
      )),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: new Stack(
          children: <Widget>[
            _planetCard(),
            _planetThumbnail(),
          ],
        ),
      ),
    );
  }

  Widget _planetThumbnail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new Hero(
          tag: "planet-hero-${planet.id}",
          child: new Image(
            image: new AssetImage(planet.image),
            height: 92.0,
            width: 92.0,
          ),)
    );
  }

  Widget _planetCard() {
    return Container(
      child: _planetCardContent(),
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

  // 具体内容
  Widget _planetCardContent() {
    return Container(
      // 调整未知
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      // 限制子组件的宽高，随着子元素扩展
      constraints: new BoxConstraints.expand(),
      child: new Column(
        // 对齐方式
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 4.0,
          ),
          new Text(
            planet.name,
            style: headerTextStyle,
          ),
          new Container(
            height: 10.0,
          ),
          new Text(
            planet.location,
            style: subHeaderTextStyle,
          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: _planetValue(
                      value: planet.distance,
                      image: "assets/img/ic_distance.png")),
              new Expanded(
                  child: _planetValue(
                      value: planet.gravity,
                      image: "assets/img/ic_gravity.png"))
            ],
          )
        ],
      ),
    );
  }

  Widget _planetValue({String value, String image}) {
    return new Row(
      children: <Widget>[
        new Container(width: 24.0),
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text(
          value,
          style: regularTextStyle,
        ),
      ],
    );
  }
}
