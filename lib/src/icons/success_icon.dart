import 'dart:async';


import 'package:art_sweetalert/src/icons/circle_paint.dart';
import 'package:flutter/material.dart';

class SuccessIcon extends StatefulWidget {

  final double size;

  SuccessIcon({
    this.size = 80.0
  });

  @override
  _SuccessIconState createState() => _SuccessIconState();
}

class _SuccessIconState extends State<SuccessIcon>
    with TickerProviderStateMixin {


  late AnimationController _circleAnimationController;
  late Animation<double> _circleAnimation;

  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;



  @override
  void initState() {

    _circleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );

    _circleAnimation = Tween<double>(begin: 0, end: 100.0)
      .animate(_circleAnimationController)
      ..addListener(() {
        setState(() {

        });
        if(_circleAnimationController.isCompleted) {
          _iconAnimationController.forward();
        }
      });

    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100)
    );

    _iconAnimation = Tween<double>(
        begin: (widget.size-30),
        end: (widget.size-20)
        )
        .animate(_iconAnimationController)
        ..addListener(() {
          setState(() {

          });
        });


    Timer(Duration(milliseconds: 500),() {
      _circleAnimationController.forward();
    });


    super.initState();
  }

  @override
  void dispose() {

    _circleAnimationController.dispose();
    _iconAnimationController.dispose();

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
          strokeWidth: 3.0,
          fillColor: Color.fromRGBO(165,220, 134, 0.3),
          color: Color.fromRGBO(165,220, 134,1.0),
        ),
        child: Container(
          
            child: Icon(
              Icons.check,
              size: _iconAnimation.value,
              color: _iconAnimation.isCompleted ?
                  Color.fromRGBO(165,220, 134,1.0) :
                  Color.fromRGBO(165,220, 134, 0.3)
            )
        ),
      ),
    );
  }
}

