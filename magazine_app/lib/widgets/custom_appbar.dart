import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:magazine_app/pages/list_articles.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:rect_getter/rect_getter.dart';

class CustomAppBar extends StatefulWidget {
  final bool inverted;
  final bool popBack;
  const CustomAppBar({Key key, this.inverted = false, this.popBack = false})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;
  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);

  Widget _ripple() {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onTap() async {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(PageRouteTransition(
            animationType: AnimationType.FADE,
            builder: (BuildContext context) => ListArticles()))
        .then((_) => setState(() => rect = null));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 40,
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.popBack
                    ? GestureDetector(
                        child: Icon(
                          FeatherIcons.chevronLeft,
                          color: widget.inverted ? Colors.black : Colors.white,
                          size: 26,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      )
                    : GestureDetector(
                        child: Icon(
                          FeatherIcons.menu,
                          color: widget.inverted ? Colors.black : Colors.white,
                          size: 26,
                        ),
                        onTap: () {},
                      ),
                GestureDetector(
                  key: rectGetterKey,
                  child: Icon(
                    FeatherIcons.search,
                    color: widget.inverted ? Colors.black : Colors.white,
                    size: 26,
                  ),
                  onTap: _onTap,
                )
              ],
            ),
          ),
        ),
        _ripple(),
      ],
    );
  }
}
