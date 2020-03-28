import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iosunlock/unlock/unlock_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(new MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryTextTheme: TextTheme(
          headline: TextStyle(
            fontFamily: 'Helvetica'
          )
        )
      ),
      home: UnlockScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
