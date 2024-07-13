import 'dart:async';
import 'package:flutter/material.dart';

class BouncingAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const BouncingAnimation({
    super.key,
    required this.child,
    required this.duration,
  });

  @override
  BouncingAnimationState createState() => BouncingAnimationState();
}

class BouncingAnimationState extends State<BouncingAnimation>
    with SingleTickerProviderStateMixin {
  late double _scale;

  late AnimationController _animate;

  @override
  void initState() {
    _animate = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animate.value;
    return GestureDetector(
      onTap: () {
        _animate.forward();

        Future.delayed(widget.duration, () {
          _animate.reverse();
        });
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
