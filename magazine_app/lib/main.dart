import 'package:flutter/material.dart';
import 'package:magazine_app/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Magazine app",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
