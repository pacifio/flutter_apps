import 'dart:ui';

import 'package:flutter/material.dart';

class Blurred extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;
  final double radius;

  const Blurred({Key key, this.width, this.height, this.color, this.child, this.radius = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        color: color ?? Colors.black.withOpacity(0.5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: child,
        ),
      ),
    );
  }
}
