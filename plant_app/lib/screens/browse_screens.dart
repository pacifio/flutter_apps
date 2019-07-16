import 'package:flutter/material.dart';
import './colors.dart';
import './detail_screen.dart';
import './settings_screen.dart';

const producsts = [
  {'image': 'assets/plants.jpg', 'count': '147', 'name': 'Plants'},
  {'image': 'assets/seeds.jpg', 'count': '16', 'name': 'Seeds'},
  {'image': 'assets/flowers.jpg', 'count': '68', 'name': 'Flowers'},
  {'image': 'assets/sprayers.jpg', 'count': '17', 'name': 'Sprayers'},
  {'image': 'assets/pots.jpg', 'count': '47', 'name': 'Pots'},
  {'image': 'assets/fertilizers.jpg', 'count': '9', 'name': 'Fertilizers'},
];

const inspirations = [
  {'image': 'assets/plants.jpg', 'count': '147', 'name': 'Plants'},
  {'image': 'assets/flowers.jpg', 'count': '68', 'name': 'Flowers'},
];

const shop = [
  {'image': 'assets/seeds.jpg', 'count': '16', 'name': 'Seeds'},
  {'image': 'assets/sprayers.jpg', 'count': '17', 'name': 'Sprayers'},
  {'image': 'assets/pots.jpg', 'count': '47', 'name': 'Pots'},
  {'image': 'assets/fertilizers.jpg', 'count': '9', 'name': 'Fertilizers'},
];

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key key}) : super(key: key);

  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[primaryColor1, secondaryColorGreen],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.0),
        child: AppBar(
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.only(left: 20.0, bottom: 70.0, right: 20.0),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsScreen()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage("assets/user.jpg"),
                      ),
                    )
                  ],
                )),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color(0xFFC5CCD6)),
          bottom: PreferredSize(
            preferredSize: Size(50.0, 50.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: TabBar(
                controller: controller,
                tabs: <Widget>[
                  Tab(text: "Products"),
                  Tab(text: "Inspirations"),
                  Tab(text: "Shop"),
                ],
                indicatorColor: secondaryColorGreen,
                labelStyle: TextStyle(
                  foreground: Paint()..shader = linearGradient,
                ),
                isScrollable: false,
                unselectedLabelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[ProductsTab(), InspirationsTab(), ShopTab()],
      ),
    );
  }
}

class ProductsTab extends StatelessWidget {
  const ProductsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 15.0),
            itemCount: producsts.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailScreen()));
                },
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 55,
                          offset: Offset(0.0, 15.0),
                          color: Color(0xFF9DA3B4).withOpacity(0.16))
                    ],
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image(
                          image: AssetImage(producsts[index]['image']),
                          width: 60.0,
                          height: 60.0,
                        ),
                        Text(
                          producsts[index]['name'],
                          style: TextStyle(
                              color: Color(0xFF444444),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${producsts[index]['count']} products",
                          style: TextStyle(
                              color: Color(0xFFC5CCD6),
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class InspirationsTab extends StatelessWidget {
  const InspirationsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 15.0),
            itemCount: inspirations.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 55,
                        offset: Offset(0.0, 15.0),
                        color: Color(0xFF9DA3B4).withOpacity(0.16))
                  ],
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image(
                        image: AssetImage(inspirations[index]['image']),
                        width: 60.0,
                        height: 60.0,
                      ),
                      Text(
                        inspirations[index]['name'],
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${inspirations[index]['count']} products",
                        style: TextStyle(
                            color: Color(0xFFC5CCD6),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class ShopTab extends StatelessWidget {
  const ShopTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(20.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30.0,
                mainAxisSpacing: 15.0),
            itemCount: shop.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 55,
                        offset: Offset(0.0, 15.0),
                        color: Color(0xFF9DA3B4).withOpacity(0.16))
                  ],
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image(
                        image: AssetImage(shop[index]['image']),
                        width: 60.0,
                        height: 60.0,
                      ),
                      Text(
                        shop[index]['name'],
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${shop[index]['count']} products",
                        style: TextStyle(
                            color: Color(0xFFC5CCD6),
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
