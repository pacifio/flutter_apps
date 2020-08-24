import 'package:flutter/material.dart';
import './colors.dart';
import './browse_screens.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Login",
                style: TextStyle(
                    color: Color(0xFF323643),
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFFC5CCD6)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  cursorColor: Color(0xFF979797),
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: lightGrey),
                      focusColor: Colors.black,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797)))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  cursorColor: Color(0xFF979797),
                  decoration: InputDecoration(
                      obscureText: true,
                      labelText: "Password",
                      labelStyle: TextStyle(color: lightGrey),
                      focusColor: Colors.black,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF979797)))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BrowseScreen()));
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
                Text(
                  "Forgot your password",
                  style: TextStyle(
                      color: blueGrey,
                      fontSize: 12.0,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
