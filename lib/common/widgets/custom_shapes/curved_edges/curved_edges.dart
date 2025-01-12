import 'package:flutter/material.dart';

class UniCustomeCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    //curve at the start
    final firstPoint = Offset(0, size.height - 20);
    final lastPoint = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstPoint.dx, firstPoint.dy, lastPoint.dx, lastPoint.dy);

    //straight line
    final secondPoint = Offset(0, size.height - 20);
    final secondLastPoint = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        secondPoint.dx, secondPoint.dy, secondLastPoint.dx, secondLastPoint.dy);

    //third curve
    final thirdPoint = Offset(size.width, size.height - 20);
    final thirdLastPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        thirdPoint.dx, thirdPoint.dy, thirdLastPoint.dx, thirdLastPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
