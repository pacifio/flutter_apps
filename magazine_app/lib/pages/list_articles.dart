import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:magazine_app/widgets/list_card.dart';

class ListArticles extends StatefulWidget {
  ListArticles({Key key}) : super(key: key);

  @override
  _ListArticlesState createState() => _ListArticlesState();
}

class _ListArticlesState extends State<ListArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            FeatherIcons.chevronLeft,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FeatherIcons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "magazine".toUpperCase(),
                style: TextStyle(
                    fontFamily: "Butler", fontSize: 30, color: Colors.black),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: Colors.black,
              margin: EdgeInsets.only(bottom: 30),
            ),
            ListCard(
              image: "cover.jpg",
              title: "Sunrise market",
              date: "February 27th 2019",
            ),
            ListCard(
              image: "beauty.jpg",
              title: "Ethereal Beauty",
              date: "March 3rd  2019",
              inverted: true,
            ),
            ListCard(
              image: "mood.jpg",
              title: "Colour Mood",
              date: "March 6th  2019",
            ),
            ListCard(
              image: "milena.jpg",
              title: "Milena Notes",
              date: "February 22nd 2019",
              inverted: true,
            ),
          ],
        ),
      ),
    );
  }
}
