import 'dart:async';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

class ErrorIcon extends StatefulWidget {
  final double size;

  const ErrorIcon({Key? key, this.size = 80.0}) : super(key: key);

  @override
  _ErrorIconState createState() => _ErrorIconState();
}

class _ErrorIconState extends State<ErrorIcon> with TickerProviderStateMixin {
  late AnimationController _circleAnimationController;
  late Animation<double> _circleAnimation;

  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  late Timer _forwardTimer;

  @override
  void initState() {
    _circleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _circleAnimation = Tween<double>(begin: 100.0, end: 0.0)
        .animate(_circleAnimationController)
      ..addListener(() {
        setState(() {});
        if (_circleAnimationController.isCompleted) {
          _iconAnimationController.forward();
        }
      });

    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _iconAnimation =
        Tween<double>(begin: (widget.size*37.5)/100, end: (widget.size*75)/100)
            .animate(_iconAnimationController)
          ..addListener(() {
            setState(() {});
          });

    _forwardTimer = Timer(Duration(milliseconds: 500), () {
      _circleAnimationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _circleAnimationController.dispose();
    _iconAnimationController.dispose();
    _forwardTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        foregroundPainter: CirclePaint(
          rate: _circleAnimation.value,
          strokeWidth: 6.0,
          fillColor: Color.fromRGBO(242, 116, 116, 0),
          color: Color.fromRGBO(242, 116, 116, 1),
        ),
        child: Container(
            child: Icon(Icons.close,
                size: _iconAnimation.value,
                color: Color.fromRGBO(242, 116, 116, 1))),
      ),
    );
  }
}
