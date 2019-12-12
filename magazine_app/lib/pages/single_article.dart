import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:magazine_app/mock.dart';
import 'package:magazine_app/widgets/custom_appbar.dart';

class SingleArticle extends StatefulWidget {
  final String image;
  final String title;
  final String date;
  final Color verticalBorderColor;
  SingleArticle(
      {Key key,
      @required this.image,
      this.title,
      this.date,
      this.verticalBorderColor = Colors.blue})
      : super(key: key);

  @override
  _SingleArticleState createState() => _SingleArticleState();
}

class _SingleArticleState extends State<SingleArticle>
    with SingleTickerProviderStateMixin {
  Animation opacityContainer;
  Animation translateDownContainer;
  Animation translateUpText;
  Animation opacityText;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..addListener(() {
        setState(() {});
      });
    translateDownContainer =
        Tween(begin: Offset(0.0, 20), end: Offset(0.0, 0.0)).animate(
            CurvedAnimation(curve: Curves.easeIn, parent: animationController));
    opacityContainer = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Interval(0.4, 0.7, curve: Curves.easeIn),
        parent: animationController));
    translateUpText = Tween(begin: Offset(0.0, -20), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(
      curve: Interval(0.7, 1.0, curve: Curves.easeIn),
      parent: animationController,
    ));
    opacityText = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Interval(0.8, 0.9, curve: Curves.easeIn),
        parent: animationController));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Hero(
              tag: widget.image,
              child: Image(
                image: AssetImage("images/${widget.image}"),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 2 - 40,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 100,
            left: 20,
            child: Transform.translate(
              offset: translateDownContainer.value,
              child: Opacity(
                opacity: opacityContainer.value,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 3,
                        height: 50,
                        color: widget.verticalBorderColor,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.date.toUpperCase(),
                            style: TextStyle(fontSize: 16, letterSpacing: 2),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              widget.title.toUpperCase(),
                              style:
                                  TextStyle(fontFamily: "Butler", fontSize: 40),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Transform.translate(
                            offset: translateUpText.value,
                            child: Opacity(
                              opacity: opacityText.value,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Text(
                                      SINGLE_ARTICLE_CHUNK_1.trim(),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 280,
                                    child: Text(
                                      SINGLE_ARTICLE_CHUNK_2.trim(),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "02",
                                style: TextStyle(
                                    fontFamily: "Butler",
                                    fontSize: 28,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 40,
                                height: 2,
                                color: Colors.black,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomAppBar(
            popBack: true,
          )
        ],
      ),
    );
  }
}
