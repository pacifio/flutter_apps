import 'package:dribble/colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation ballBounce;
  Animation shadowFade;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward(from: 0.0);
            }
          });
    ballBounce = Tween(begin: Offset(0, 0), end: Offset(0, -20.0))
        .animate(animationController);
    shadowFade = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.4, 1.0), parent: animationController));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Transform.translate(
            offset: ballBounce.value,
            child: Image(
              image: AssetImage("images/icon.png"),
              height: 140,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Opacity(
            opacity: shadowFade.value,
            child: ClipOval(
              child: Container(
                height: 15,
                color: Colors.black.withOpacity(0.2),
                width: 100,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              "What are you working on?",
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 32, wordSpacing: 0.6),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                "Dribbble is where designers get inspired and hired .",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 80,
            height: 40,
            decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(6.0)),
            child: Center(
              child: Text(
                "Sign up",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "I already have an account",
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_right,
                size: 20,
                color: Colors.blue,
              )
            ],
          ),
        ],
      ),
    );
  }
}
