




import 'package:flutter/material.dart';

class SelectedClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path =Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(0, 15, 10, 30);
    path.quadraticBezierTo(30, size.height / 2, 10, size.height - 30);
    path.quadraticBezierTo(0, size.height - 15, 0, size.height);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
   return true;
  }

}