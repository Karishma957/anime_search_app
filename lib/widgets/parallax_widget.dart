import 'package:flutter/material.dart';

class ParallaxWidget extends StatelessWidget {
  final String imgUrl;
  final double top;
  final double width;
  ParallaxWidget({this.imgUrl,this.top,this.width});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Container(
        height: width*2.25,
        width: width,
        child: Image.asset(
          'assets/images/$imgUrl.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
