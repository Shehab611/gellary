import 'package:flutter/material.dart';

class HomeCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width, y = size.height;
    Paint paint = Paint()..color = const Color(0xffDFCFFF);
    final path = Path();
    path.moveTo(x * 0.55, 0);
    path.quadraticBezierTo(x * 0.7, y * 0.04, x * 0.685, y * 0.1);
    path.quadraticBezierTo(x * 0.68, y * 0.17, x * 0.865, y * 0.17);
    path.quadraticBezierTo(x * 0.97, y * 0.17, x, y * 0.24);
    path.lineTo(x, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
