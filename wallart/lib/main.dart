import 'package:flutter/material.dart';
import 'package:wallart/pages/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            textTheme: TextTheme(title: TextStyle(color: Colors.white)),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            ),
          )),
      initialRoute: "/",
      routes: {'/': (context) => WelcomePage()},
      debugShowCheckedModeBanner: false,
    );
  }
}
