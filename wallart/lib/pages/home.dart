import 'dart:convert' show jsonDecode;
import 'package:flutter/material.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:wallart/pages/favs.dart';
import 'package:wallart/pages/fullpage.dart';
import 'package:wallart/ripple_effect.dart';
import 'package:wallart/typography.dart';
import 'package:http/http.dart' as http;
import 'package:wallart/urlbuilder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rect_getter/rect_getter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;
  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);

  @override
  bool get wantKeepAlive => true;

  TabController tabController;
  List<String> content = [
    "Random",
    "Animals",
    "Art",
    "Cars",
    "City",
    "Dark",
    "Minimal",
    "Nature",
    "Space",
    "Sports",
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: content.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
          color: Colors.blue,
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
        .push(FadeRouteBuilder(page: FavouritesPage()))
        .then((_) => setState(() => rect = null));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Wallart",
              style: light.copyWith(
                  color: Colors.black, fontWeight: FontWeight.normal),
            ),
            elevation: 8.0,
            leading: IconButton(
              icon: Icon(FeatherIcons.menu),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              RectGetter(
                key: rectGetterKey,
                child: IconButton(
                  icon: Icon(FeatherIcons.heart),
                  onPressed: () {
                    _onTap();
                  },
                ),
              )
            ],
            bottom: TabBar(
              controller: tabController,
              isScrollable: true,
              tabs: content
                  .map((text) => Tab(
                        text: text,
                      ))
                  .toList(),
              labelStyle: light.copyWith(fontSize: 16),
              labelColor: Colors.black,
              indicatorWeight: 3.0,
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: content
                .map((text) => RenderTab(
                      queryText: text,
                    ))
                .toList(),
          ),
        ),
        _ripple()
      ],
    );
  }
}

class RenderTab extends StatefulWidget {
  final String queryText;
  RenderTab({Key key, this.queryText}) : super(key: key);

  @override
  _RenderTabState createState() => _RenderTabState();
}

class _RenderTabState extends State<RenderTab>
    with AutomaticKeepAliveClientMixin {
  bool loaded = false;
  List<dynamic> images;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    bool cond = widget.queryText == "Random";
    String url = cond
        ? fetchRandoms(limit: 30, page: 1)
        : fetchQuery(limit: 30, page: 1, q: widget.queryText);
    http.get(url).then((response) {
      setState(() {
        images = cond
            ? jsonDecode(response.body)
            : jsonDecode(response.body)['results'];
        loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: loaded
          ? StaggeredGridView.countBuilder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                final image = images[index]['urls']['regular'];
                return Hero(
                  tag: image,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FullPage(
                                image: image,
                              )));
                    },
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: image,
                        placeholder: (context, url) => SpinKitPulse(
                          color: Colors.blue,
                          size: 30,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                );
              },
              crossAxisCount: 4,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              staggeredTileBuilder: (_) => StaggeredTile.fit(2),
            )
          : Center(
              child: SpinKitFadingFour(
                color: Colors.blue,
                size: 50.0,
              ),
            ),
    );
  }
}
