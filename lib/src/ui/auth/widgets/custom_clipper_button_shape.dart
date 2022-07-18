import 'package:flutter/material.dart';

class CustomClipperButtonShape extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..lineTo(size.width * .999 ,0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * .80, size.height)
      ..lineTo(size.width * .50, size.height * 50)
      ..lineTo(0, size.height * .50)
      ..lineTo(0, size.height * .50)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }


}