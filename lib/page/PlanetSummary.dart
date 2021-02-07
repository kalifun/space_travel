import 'package:flutter/material.dart';
import 'package:space_travel/model/Planet.dart';
import 'package:space_travel/model/StyleValue.dart';
import 'package:space_travel/page/Page.dart';

class PlanetSummary extends StatelessWidget {
  final Planet planet;
  final bool horizontal;

  PlanetSummary(this.planet, {this.horizontal = true});

  PlanetSummary.vertical(this.planet) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new DetailPage(planet),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
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
        alignment:
            horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
        child: new Hero(
          tag: "planet-hero-${planet.id}",
          child: new Image(
            image: new AssetImage(planet.image),
            height: 92.0,
            width: 92.0,
          ),
        ));
  }

  Widget _planetCard() {
    return Container(
      child: _planetCardContent(),
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
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
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 15.0),
      // 限制子组件的宽高，随着子元素扩展
      constraints: new BoxConstraints.expand(),
      child: new Column(
        // 对齐方式
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name, style: titleTextStyle),
          new Container(height: 10.0),
          new Text(planet.location, style: commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: planet.distance,
                      image: "assets/img/ic_distance.png")),
              new Container(
                width: 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
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
    return new Container(
        child: new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // new Container(width: 24.0),
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text(
          value,
          style: smallTextStyle,
        ),
      ],
    ));
  }
}
