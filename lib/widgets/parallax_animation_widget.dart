import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class ParallaxAnimationWidget extends StatelessWidget {
  final String animationUrl;
  final String animationName;
  final double top;
  final double width;
  ParallaxAnimationWidget({this.animationUrl,this.top,this.width,this.animationName});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Container(
        height: width*2.25,
        width: width,
        child: FlareActor(
          'assets/animations/$animationUrl.flr',
          alignment: Alignment.center,
          fit: BoxFit.fitHeight,
          animation: animationName,
          shouldClip: true,
        ),
      ),
    );
  }
}