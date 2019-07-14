import 'package:flutter/material.dart';
import './colors.dart';
import './login_screen.dart';

class GreetingScreen extends StatefulWidget {
  GreetingScreen({Key key}) : super(key: key);

  _GreetingScreenState createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[primaryColor1, secondaryColorGreen],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Your home. ",
                style: TextStyle(
                    fontSize: 26.0,
                    color: lightBlack,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Greener",
                style: TextStyle(
                    fontSize: 26.0,
                    foreground: Paint()..shader = linearGradient,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            "Enjoy the experience",
            style: TextStyle(color: lightGrey, fontSize: 18.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Image(
            image: AssetImage("assets/welcome_art.jpg"),
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 75,
              height: 48,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [primaryColor1, secondaryColorGreen],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF9DA3B4).withOpacity(0.1),
                        blurRadius: 65.0,
                        offset: Offset(0.0, 15.0))
                  ]),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Color(0xFFFBFBFB),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 75,
            height: 48,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Color(0xFF9DA3B4).withOpacity(0.2),
                  blurRadius: 65.0,
                  offset: Offset(0.0, 15.0))
            ]),
            child: Center(
              child: Text(
                "Sign up",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Terms of service",
            style: TextStyle(color: blueGrey, fontSize: 12),
          )
        ],
      ),
    );
  }
}
