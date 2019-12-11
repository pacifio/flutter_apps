import 'package:flutter/material.dart';
import 'package:magazine_app/widgets/single_page.dart';

class MainSlider extends StatefulWidget {
  MainSlider({Key key}) : super(key: key);

  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  double pageOffset = 0.0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: AlwaysScrollableScrollPhysics(),
      controller: pageController,
      children: <Widget>[
        SinglePage(
          image: "cover.jpg",
          title: "Sunrise market",
          date: "February 27th 2019",
          offset: pageOffset,
        ),
        SinglePage(
          image: "beauty.jpg",
          title: "Ethereal Beauty",
          date: "March 3rd  2019",
          offset: pageOffset - 1,
        ),
        SinglePage(
          image: "mood.jpg",
          title: "Colour Mood",
          date: "March 6th  2019",
          offset: pageOffset - 2,
        ),
        SinglePage(
          image: "milena.jpg",
          title: "Milena Notes",
          date: "February 22nd 2019",
          offset: pageOffset - 3,
        ),
      ],
    );
  }
}
