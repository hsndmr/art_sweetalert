import 'package:flutter/material.dart';

class QuestionPaint extends CustomPainter {
  final Color? color;

  QuestionPaint({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.3284375, size.height * 0.3616250);
    path.arcToPoint(Offset(size.width * 0.3435000, size.height * 0.3770625),
        radius: Radius.elliptical(
            size.width * 0.01481250, size.height * 0.01481250),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size.width * 0.3950625, size.height * 0.3770625);
    path.cubicTo(
        size.width * 0.4036875,
        size.height * 0.3770625,
        size.width * 0.4105625,
        size.height * 0.3700000,
        size.width * 0.4116875,
        size.height * 0.3614375);
    path.cubicTo(
        size.width * 0.4173125,
        size.height * 0.3204375,
        size.width * 0.4454375,
        size.height * 0.2905625,
        size.width * 0.4955625,
        size.height * 0.2905625);
    path.cubicTo(
        size.width * 0.5384375,
        size.height * 0.2905625,
        size.width * 0.5776875,
        size.height * 0.3120000,
        size.width * 0.5776875,
        size.height * 0.3635625);
    path.cubicTo(
        size.width * 0.5776875,
        size.height * 0.4032500,
        size.width * 0.5543125,
        size.height * 0.4215000,
        size.width * 0.5173750,
        size.height * 0.4492500);
    path.cubicTo(
        size.width * 0.4753125,
        size.height * 0.4798125,
        size.width * 0.4420000,
        size.height * 0.5155000,
        size.width * 0.4443750,
        size.height * 0.5734375);
    path.lineTo(size.width * 0.4445625, size.height * 0.5870000);
    path.arcToPoint(Offset(size.width * 0.4601875, size.height * 0.6023750),
        radius: Radius.elliptical(
            size.width * 0.01562500, size.height * 0.01562500),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size.width * 0.5108750, size.height * 0.6023750);
    path.arcToPoint(Offset(size.width * 0.5265000, size.height * 0.5867500),
        radius: Radius.elliptical(
            size.width * 0.01562500, size.height * 0.01562500),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size.width * 0.5265000, size.height * 0.5801875);
    path.cubicTo(
        size.width * 0.5265000,
        size.height * 0.5353125,
        size.width * 0.5435625,
        size.height * 0.5222500,
        size.width * 0.5896250,
        size.height * 0.4873125);
    path.cubicTo(
        size.width * 0.6276875,
        size.height * 0.4583750,
        size.width * 0.6673750,
        size.height * 0.4262500,
        size.width * 0.6673750,
        size.height * 0.3588125);
    path.cubicTo(
        size.width * 0.6673750,
        size.height * 0.2643750,
        size.width * 0.5876250,
        size.height * 0.2187500,
        size.width * 0.5003125,
        size.height * 0.2187500);
    path.cubicTo(
        size.width * 0.4211250,
        size.height * 0.2187500,
        size.width * 0.3343750,
        size.height * 0.2556250,
        size.width * 0.3284375,
        size.height * 0.3616250);
    path.close();
    path.moveTo(size.width * 0.4257500, size.height * 0.7218125);
    path.cubicTo(
        size.width * 0.4257500,
        size.height * 0.7551250,
        size.width * 0.4523125,
        size.height * 0.7797500,
        size.width * 0.4888750,
        size.height * 0.7797500);
    path.cubicTo(
        size.width * 0.5269375,
        size.height * 0.7797500,
        size.width * 0.5531250,
        size.height * 0.7551250,
        size.width * 0.5531250,
        size.height * 0.7218125);
    path.cubicTo(
        size.width * 0.5531250,
        size.height * 0.6873125,
        size.width * 0.5268750,
        size.height * 0.6630625,
        size.width * 0.4888125,
        size.height * 0.6630625);
    path.cubicTo(
        size.width * 0.4523125,
        size.height * 0.6630625,
        size.width * 0.4257500,
        size.height * 0.6873125,
        size.width * 0.4257500,
        size.height * 0.7218125);
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

class QuestionShape extends StatelessWidget {
  final Color? color;
  final double size;

  QuestionShape({this.color, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: QuestionPaint(color: color),
      ),
    );
  }
}
