import 'package:flutter/material.dart';
import 'package:magazine_app/widgets/custom_appbar.dart';
import 'package:magazine_app/widgets/slider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[MainSlider(), CustomAppBar()],
      ),
    );
  }
}
