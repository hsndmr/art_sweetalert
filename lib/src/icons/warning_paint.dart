import 'package:flutter/material.dart';

class WarningPaint extends CustomPainter {
  final Color? color;

  WarningPaint({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.4376250, size.height * 0.6875000);
    path.arcToPoint(Offset(size.width * 0.5626250, size.height * 0.6875000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path.arcToPoint(Offset(size.width * 0.4376250, size.height * 0.6875000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.close();
    path.moveTo(size.width * 0.4437500, size.height * 0.3121875);
    path.arcToPoint(Offset(size.width * 0.5562500, size.height * 0.3121875),
        radius: Radius.elliptical(
            size.width * 0.05656250, size.height * 0.05656250),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path.lineTo(size.width * 0.5343750, size.height * 0.5313750);
    path.arcToPoint(Offset(size.width * 0.4656250, size.height * 0.5313750),
        radius: Radius.elliptical(
            size.width * 0.03456250, size.height * 0.03456250),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.4437500, size.height * 0.3121875);
    path.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = color!;
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WarningShape extends StatelessWidget {
  final Color? color;
  final double size;

  WarningShape({this.color, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: WarningPaint(color: color),
      ),
    );
  }
}
