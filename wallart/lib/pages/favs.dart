import 'package:flutter/material.dart';
import 'package:wallart/typography.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavouritesPage extends StatefulWidget {
  FavouritesPage({Key key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<String> images = [];
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  fetchImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      images = prefs.getStringList("images");
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8.0,
        title: Text(
          "Favourites",
          style: light.copyWith(
              color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: !loaded
            ? SpinKitFadingFour(
                size: 50,
                color: Colors.blue,
              )
            : images.length == 0 || images == [] || images == null
                ? Center(
                    child: Text("No images here",
                        style: light.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)))
                : StaggeredGridView.countBuilder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final image = images[index];
                      return Hero(
                        tag: image,
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: image,
                            placeholder: (context, url) => SpinKitPulse(
                              color: Colors.blue,
                              size: 30,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      );
                    },
                    crossAxisCount: 4,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    staggeredTileBuilder: (_) => StaggeredTile.fit(2)),
      ),
    );
  }
}
