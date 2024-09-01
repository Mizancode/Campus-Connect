import 'package:flutter/material.dart';

class ColorSpreadPainter extends CustomPainter {
  final double progress;

  ColorSpreadPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff003366)
      ..style = PaintingStyle.fill;

    double radius =
        progress * (size.width > size.height ? size.width : size.height);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
