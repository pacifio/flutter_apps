import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallart/typography.dart';

class FullPage extends StatefulWidget {
  final String image;
  FullPage({Key key, this.image}) : super(key: key);

  @override
  _FullPageState createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  handleTap(newImage, context) async {
    List<String> newImageList = [];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final images = preferences.getStringList("images");
    if (images == [] || images == null) {
      newImageList.add(newImage);
    } else {
      images.add(newImage);
      newImageList = images;
    }
    preferences.setStringList("images", newImageList);
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 50,
              color: Colors.black,
              child: Center(
                child: Text(
                  "Image saved to favourites",
                  style: light.copyWith(
                      fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Hero(
            tag: widget.image,
            child: CachedNetworkImage(
              imageUrl: widget.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                child: Center(
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.black.withOpacity(0.5),
              )),
        ),
        Positioned(
          bottom: 40,
          right: 20,
          child: Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    handleTap(widget.image, context);
                  },
                  child: CircleAvatar(
                    child: Center(
                      child: Icon(
                        FeatherIcons.heart,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.5),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
