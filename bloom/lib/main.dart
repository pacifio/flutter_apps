import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

enum Direction { up, down }

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  Direction _direction;
  GifController _gifController;
  double _frame = 0.0;

  @override
  void initState() {
    super.initState();

    _gifController = GifController(vsync: this);
    _gifController.value = _frame;

    _scrollController = ScrollController();
    _direction = Direction.down;

    _scrollController.addListener(_handleScrollEvent);
  }

  void _handleScrollEvent() {
    if (_direction == Direction.down) {
      setState(() {
        _frame -= 0.5;
        _gifController.value = math.min(math.max(_frame, 0.0), 59.0);
      });
    } else if (_direction == Direction.up) {
      setState(() {
        _frame += 0.5;
        _gifController.value = math.min(math.max(_frame, 0.0), 59.0);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScrollEvent);
    _scrollController.dispose();
    super.dispose();
  }

  bool _handleNotification(Notification notification) {
    if (notification is ScrollNotification) {
      if (notification is UserScrollNotification &&
          notification.direction == ScrollDirection.forward) {
        setState(() {
          _direction = Direction.down;
        });
      } else if (notification is UserScrollNotification &&
          notification.direction == ScrollDirection.reverse) {
        setState(() {
          _direction = Direction.up;
        });
      }
    }

    return true;
  }

  Widget _upperSection() {
    final TextStyle textStyle =
        TextStyle(fontFamily: 'worksans', color: Colors.white);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Image.asset('images/xd.png'),
          actions: <Widget>[Image.asset('images/menu.png')],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            Text(
              "Let your ideas",
              style: textStyle.copyWith(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Bloom",
              style: textStyle.copyWith(
                  fontSize: 100, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Share your amazing Adobe Xd Projects for the world to see",
                style: textStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 37,
            ),
            Image.asset('images/arrow.png'),
            Spacer(),
            FittedBox(
              child: GifImage(
                controller: _gifController,
                image: AssetImage('images/bloom.gif'),
                height: 300.0,
                width: 400.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _lowerPart() {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        color: Colors.pink.shade50,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: FloatingActionButton(
              backgroundColor: Colors.pink.shade100,
              splashColor: Colors.green,
              child: Icon(
                Icons.refresh,
                color: Colors.black,
              ),
              onPressed: () {
                _scrollController.animateTo(0.0,
                    duration: Duration(milliseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn);
                _gifController.animateTo(0.0, duration: Duration(seconds: 1));
                setState(() {
                  _frame = 0.0;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _handleNotification,
      child: ListView(
        controller: _scrollController,
        children: <Widget>[_upperSection(), _lowerPart()],
      ),
    );
  }
}
