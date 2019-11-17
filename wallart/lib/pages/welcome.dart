import 'package:flutter/material.dart';
import 'package:wallart/pages/home.dart';
import 'package:wallart/slide_route.dart';
import 'package:wallart/typography.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation arrowAnimation;
  Animation opacity;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    arrowAnimation = Tween<double>(begin: 0.0, end: 12.0).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.fastLinearToSlowEaseIn));
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.5, 1.0),
    ));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image(
            image: AssetImage("images/background.jpg"),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    children: <Widget>[
                      Text("Wallart",
                          style: bold.copyWith(
                              decoration: TextDecoration.none, fontSize: 34)),
                      Text("powered by unsplash",
                          style: light.copyWith(
                              decoration: TextDecoration.none, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 80),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Text(
                          "Download wallpapers and stock images for free , powered by unsplash.com",
                          style: light.copyWith(
                              fontSize: 14,
                              wordSpacing: 0,
                              letterSpacing: 0,
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              SlidePageRoute(builder: (context) => HomePage()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue.withOpacity(0.2),
                                    blurRadius: 40,
                                    offset: Offset(0, 10))
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Get started",
                                style: light.copyWith(
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AnimatedBuilder(
                                animation: animationController,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(arrowAnimation.value, 0),
                                    child: Opacity(
                                      // opacity: opacity.value,
                                      opacity: 1.0,
                                      child: Icon(
                                        FeatherIcons.chevronRight,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
