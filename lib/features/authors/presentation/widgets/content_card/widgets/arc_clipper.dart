import 'package:flutter/material.dart';

class ArcClipper extends CustomClipper<Path> {
  ArcClipper();

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(25, 0);
    path.quadraticBezierTo(0, size.height / 2, 25, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
