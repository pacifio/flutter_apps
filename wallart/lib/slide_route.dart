import 'package:flutter/material.dart';

class SlidePageRoute extends MaterialPageRoute {
  SlidePageRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final customAnimation = Tween<Offset>(
            begin: Offset(1.0, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));
    return SlideTransition(
      position: customAnimation,
      child: child,
    );
  }
}
