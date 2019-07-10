import 'package:flightapp/custom_shape_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Color firstColor = Color(0xFFFF6900); // #FF6900
Color secondColor = Color(0xFFFF6500); // #FF6500

List<String> locations = ['Boston (BOS)', 'New york (JFK)'];
const TextStyle dropDownTextStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

void main() => runApp(MaterialApp(
      title: "Flight App",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
          SizedBox(
            height: 20.0,
          ),
          HomeScreenBottomPart()
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  HomeScreenTopPart({Key key}) : super(key: key);

  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedIndex = 0;
  var isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 360.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(locations[selectedIndex],
                                style: dropDownTextStyle),
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          PopupMenuItem(
                            child: Text(locations[0], style: dropDownMenuStyle),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child: Text(locations[1], style: dropDownMenuStyle),
                            value: 1,
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Where would \n you want to go ?',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(text: locations[1]),
                      style: dropDownMenuStyle,
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 15.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFlightSelected = true;
                          });
                        },
                        child: ChoiceChips(
                          icon: Icons.airplanemode_active,
                          name: "Flights",
                          isSelected: isFlightSelected,
                        )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFlightSelected = false;
                          });
                        },
                        child: ChoiceChips(
                          icon: Icons.hotel,
                          name: "Hotels",
                          isSelected: !isFlightSelected,
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChoiceChips extends StatefulWidget {
  final IconData icon;
  final String name;
  final bool isSelected;

  ChoiceChips({this.icon, this.name, this.isSelected});

  _ChoiceChipsState createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20.0)))
          : null,
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              widget.name,
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}

class HomeScreenBottomPart extends StatefulWidget {
  HomeScreenBottomPart({Key key}) : super(key: key);

  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text("Currently Watched Items",
                    style: dropDownMenuStyle.copyWith(
                        fontWeight: FontWeight.w600)),
                Spacer(),
                Text(
                  "View all (12)".toUpperCase(),
                  style: TextStyle(
                      fontSize: 14.5,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 240.0,
            child:
                ListView(scrollDirection: Axis.horizontal, children: cityCards),
          )
        ],
      ),
    );
  }
}

List<CityCard> cityCards = [
  CityCard(
    imagePath: "assets/images/lasvegas.jpg",
    cityName: "Las vegas",
    monthYear: "Feb 2019",
    discount: "45",
    oldPrice: "1000",
    newPrice: "399",
  ),
  CityCard(
    imagePath: "assets/images/athens.jpg",
    cityName: "Athens",
    monthYear: "Jan 2019",
    discount: "45",
    oldPrice: "1000",
    newPrice: "399",
  ),
  CityCard(
    imagePath: "assets/images/sydney.jpeg",
    cityName: "Sydney",
    monthYear: "Apr 2019",
    discount: "45",
    oldPrice: "1000",
    newPrice: "399",
  )
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;
  const CityCard(
      {this.imagePath,
      this.cityName,
      this.monthYear,
      this.discount,
      this.oldPrice,
      this.newPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210.0,
                  width: 160.0,
                  child: Image.asset(this.imagePath, fit: BoxFit.cover),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 50.0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.black12])),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cityName,
                        style: dropDownTextStyle.copyWith(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Text(monthYear,
                              style: dropDownTextStyle.copyWith(
                                  fontSize: 14.0, color: Colors.grey[300])),
                          SizedBox(width: 30.0),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.white.withOpacity(0.95),
                            ),
                            child: Text(
                              "$discount%",
                              style: dropDownMenuStyle.copyWith(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Row(
              children: <Widget>[
                Text(
                  "\$$newPrice",
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "(\$$oldPrice)",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey[400]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
