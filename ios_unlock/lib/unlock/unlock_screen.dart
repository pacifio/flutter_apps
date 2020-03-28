import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:iosunlock/unlock/home_screen.dart';
import 'package:shimmer/shimmer.dart';

import 'blurred.dart';

class UnlockScreen extends StatefulWidget {
  UnlockScreen({Key key}) : super(key: key);

  @override
  _UnlockScreenState createState() => _UnlockScreenState();
}

class _UnlockScreenState extends State<UnlockScreen> {
  double sliderPosX = 4;

  Widget _upperPart() {
    final double fullWidth = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height / 4.8;
    final double textGapHeight = 10.0;
    final TextStyle clockStyle = Theme.of(context)
        .primaryTextTheme
        .headline
        .copyWith(fontSize: 62, color: Colors.white);
    final TextStyle dateStyle = clockStyle.copyWith(fontSize: 16);

    return Blurred(
      width: fullWidth,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "4:04",
            style: clockStyle,
          ),
          SizedBox(
            height: textGapHeight,
          ),
          Text(
            "Wednesday , August 09",
            style: dateStyle,
          )
        ],
      ),
    );
  }

  double _determineWidth(double width) {
    // The total width is
    // max width - (object margin / 2 + object width)
    // The total width is coming from layout builder
    return width - (4 / 2 + 55.0);
  }

  bool _isOverHalf(double width) {
    // Current position + (object width / 2) > the percentage in float * max width
    return sliderPosX + (55.0 / 2) > 0.5 * width;
  }

  void _handleHorizontalDrag(
      DragUpdateDetails details, BoxConstraints constraints) {
    setState(() {
      sliderPosX += details.delta.dx;
      sliderPosX = math.max(
          4.0, math.min(_determineWidth(constraints.maxWidth), sliderPosX));
    });
  }

  void _resetPos() {
    setState(() {
      sliderPosX = 4.0;
    });
  }

  void _snapToEnd(double width) {
    setState(() {
      sliderPosX = width;
    });

    _navigate();
  }

  void _navigate() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        sliderPosX = 4.0;
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  void _handleHorizontalDragEnd(
      DragEndDetails details, BoxConstraints constraints) {
    bool isHalf = _isOverHalf(constraints.maxWidth);
    if (isHalf) {
      _snapToEnd(_determineWidth(constraints.maxWidth));
    } else {
      _resetPos();
    }
  }

  Widget _animatedText() {
    final TextStyle textStyle =
        Theme.of(context).primaryTextTheme.headline.copyWith(fontSize: 16);

    return Center(
      child: Shimmer.fromColors(
        child: Text(
          "Slide To Unlock",
          style: textStyle,
        ),
        baseColor: Colors.black54,
        highlightColor: Colors.white,
      ),
    );
  }

  Widget _lowerPart() {
    final double fullWidth = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height / 8;

    return Blurred(
      width: fullWidth,
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Blurred(
                color: Colors.white.withOpacity(0.2),
                radius: 100.0,
              )),
              _animatedText(),
              Positioned(
                top: 1.0,
                left: sliderPosX,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) =>
                      _handleHorizontalDrag(details, constraints),
                  onHorizontalDragEnd: (details) =>
                      _handleHorizontalDragEnd(details, constraints),
                  child: Transform.scale(
                    scale: 0.9,
                    child: Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: Icon(
                          Icons.chevron_right,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadBackground() {
    return Image.asset(
      'images/background.jpg',
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: _loadBackground()),
          Positioned(
            top: 0,
            left: 0,
            child: _upperPart(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: _lowerPart(),
          )
        ],
      ),
    );
  }
}
