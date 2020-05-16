




import 'package:flutter/cupertino.dart';

class MenuClip extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
   Path path = Path();
   path.lineTo(0, 0);

   path.quadraticBezierTo(56, 20, 55, 60);
   path.lineTo(55, size.height-60);
   path.quadraticBezierTo(56, size.height-20, 0, size.height);

   path.close();
   return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}