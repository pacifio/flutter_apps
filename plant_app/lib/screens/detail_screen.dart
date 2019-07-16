import 'package:flutter/material.dart';
import './explore_screen.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key}) : super(key: key);

  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Color(0xFFC5CCD6)),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/1.png"),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        "16 Best Plants That Thrive In Your Bedroom",
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: Text(
                            "Iterior",
                            style: TextStyle(
                                color: Color(0xFF9DA3B4), fontSize: 14),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: Color(0xFF9DA3B4)),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: Text(
                            "27 m²",
                            style: TextStyle(
                                color: Color(0xFF9DA3B4), fontSize: 14),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: Color(0xFF9DA3B4)),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: Text(
                            "Ideas",
                            style: TextStyle(
                                color: Color(0xFF9DA3B4), fontSize: 14),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: Color(0xFF9DA3B4)),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Bedrooms deserve to be decorated with lush greenery just like every other room in the house – but it can be tricky to find a plant that thrives here. Low light, high humidity and warm temperatures mean only certain houseplants will flourish.",
                      style: TextStyle(
                        color: Color(0xFF9DA3B4),
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                        color: Color(0xFF323643),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 115,
                          height: 115,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/2.png")),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        Container(
                          width: 115,
                          height: 115,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/3.png")),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExploreScreen()));
                          },
                          child: Container(
                            width: 55,
                            height: 55,
                            child: Center(
                                child: Text(
                              "+13",
                              style: TextStyle(color: Color(0xFF9DA3B4)),
                            )),
                            decoration: BoxDecoration(
                                color: Color(0xFFC5CCD6),
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
