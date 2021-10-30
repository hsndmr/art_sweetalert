import 'package:flutter/material.dart';
import 'dart:math' as math;

class CirclePaint extends CustomPainter {
  final double rate;
  final double strokeWidth;
  final Color color;
  final Color fillColor;

  CirclePaint({
    this.rate = 50,
    this.strokeWidth = 3.0,
    this.color = Colors.grey,
    this.fillColor = Colors.green,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..color = this.fillColor
      ..strokeWidth = this.strokeWidth
      ..style = PaintingStyle.stroke;

    Paint arc = Paint()
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..color = this.color
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius =
        math.min(size.width / 2, size.height / 2) - this.strokeWidth;

    canvas.drawCircle(center, radius, circle);

    double angle = 2 * math.pi * ((100 - this.rate) / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), radius,
        angle, false, arc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
