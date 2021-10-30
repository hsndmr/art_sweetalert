import 'package:flutter/material.dart';

class InfoPaint extends CustomPainter {
  final Color? color;

  InfoPaint({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.5581250, size.height * 0.4117500);
    path.lineTo(size.width * 0.4150000, size.height * 0.4296875);
    path.lineTo(size.width * 0.4098750, size.height * 0.4534375);
    path.lineTo(size.width * 0.4380000, size.height * 0.4586250);
    path.cubicTo(
        size.width * 0.4563750,
        size.height * 0.4630000,
        size.width * 0.4600000,
        size.height * 0.4696250,
        size.width * 0.4560000,
        size.height * 0.4879375);
    path.lineTo(size.width * 0.4098750, size.height * 0.7046875);
    path.cubicTo(
        size.width * 0.3977500,
        size.height * 0.7607500,
        size.width * 0.4164375,
        size.height * 0.7871250,
        size.width * 0.4603750,
        size.height * 0.7871250);
    path.cubicTo(
        size.width * 0.4944375,
        size.height * 0.7871250,
        size.width * 0.5340000,
        size.height * 0.7713750,
        size.width * 0.5519375,
        size.height * 0.7497500);
    path.lineTo(size.width * 0.5574375, size.height * 0.7237500);
    path.cubicTo(
        size.width * 0.5449375,
        size.height * 0.7347500,
        size.width * 0.5266875,
        size.height * 0.7391250,
        size.width * 0.5145625,
        size.height * 0.7391250);
    path.cubicTo(
        size.width * 0.4973750,
        size.height * 0.7391250,
        size.width * 0.4911250,
        size.height * 0.7270625,
        size.width * 0.4955625,
        size.height * 0.7058125);
    path.lineTo(size.width * 0.5581250, size.height * 0.4117500);
    path.close();
    path.moveTo(size.width * 0.5625000, size.height * 0.2812500);
    path.arcToPoint(Offset(size.width * 0.4375000, size.height * 0.2812500),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path.arcToPoint(Offset(size.width * 0.5625000, size.height * 0.2812500),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: true);
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

class InfoShape extends StatelessWidget {
  final Color? color;
  final double size;

  InfoShape({this.color, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      child: CustomPaint(
        painter: InfoPaint(color: color),
      ),
    );
  }
}
