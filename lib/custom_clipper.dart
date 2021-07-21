import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..cubicTo(
          size.width*1/4,
          size.height*(1-1/15),
          size.width*0.175,
          size.height*(1-1/3),
          size.width*0.5,
          size.height*2/3)
      ..cubicTo(
        size.width * 0.825,
        size.height * 2/3,
        size.width * 0.725,
        size.height * 14/ 15,
        size.width,
        size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0,0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}