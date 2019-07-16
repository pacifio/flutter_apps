import 'package:flutter/material.dart';
import './colors.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key key}) : super(key: key);

  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: AppBar(
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.only(left: 20.0, bottom: 30.0, right: 20.0),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Browse",
                      style: TextStyle(
                          color: Color(0xFF323643),
                          fontSize: 26.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                        width: 160.0,
                        height: 40,
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF8E8E93).withOpacity(0.06),
                            borderRadius: BorderRadius.circular(6.0)),
                        child: TextField(
                          cursorColor: Color(0xFF8E8E93).withOpacity(0.06),
                          decoration: InputDecoration(
                            labelText: "Search",
                            labelStyle: TextStyle(
                                color: Color(0xFFC5CCD6), fontSize: 14),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color(0xFFC5CCD6),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                          ),
                        ))
                  ],
                )),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFFC5CCD6)),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.only(left: 20.0, bottom: 40.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/explore1.png"),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/explore2.png")),
                        Image(image: AssetImage("assets/images/explore3.png")),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/explore4.png")),
                        Image(image: AssetImage("assets/images/explore5.png")),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Image(
                      image: AssetImage("assets/images/explore6.png"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0.01),
                Colors.white.withOpacity(1)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Center(
                child: Container(
                  width: 150.0,
                  height: 40,
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
                      "Filters",
                      style: TextStyle(
                          color: Color(0xFFFBFBFB),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
