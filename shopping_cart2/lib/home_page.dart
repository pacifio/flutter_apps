import 'package:flutter/material.dart';
import 'package:shopping_cart2/details_page.dart';
import './custom_icons.dart';

const TextStyle dropDownTextStyle =
    TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400);
const TextStyle dropDownMenuStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);
const lightGrey = Color(0xFFF3F3F3);

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        title: Text("The Top Shop",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 1.2)),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            icon: new Icon(
              CustomIcon.cart,
              color: Colors.black,
              size: 32.0,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.0),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xFFF3F3F3)),
              child: TextField(
                controller: TextEditingController(text: ""),
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF787878)),
                    hintText: "Search your products",
                    hintStyle: TextStyle(color: Color(0xFF787878))),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PopupMenuButton(
                onSelected: (index) {},
                child: Row(
                  children: <Widget>[
                    Text("Sort by", style: dropDownTextStyle),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                  PopupMenuItem(
                    child: Text("Filter 1", style: dropDownMenuStyle),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text("Filter 2", style: dropDownMenuStyle),
                    value: 1,
                  )
                ],
              ),
              PopupMenuButton(
                onSelected: (index) {},
                child: Row(
                  children: <Widget>[
                    Text("Product", style: dropDownTextStyle),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                  PopupMenuItem(
                    child: Text("Filter 1", style: dropDownMenuStyle),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text("Filter 2", style: dropDownMenuStyle),
                    value: 1,
                  )
                ],
              ),
              PopupMenuButton(
                onSelected: (index) {},
                child: Row(
                  children: <Widget>[
                    Text("Style", style: dropDownTextStyle),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                  PopupMenuItem(
                    child: Text("Filter 1", style: dropDownMenuStyle),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text("Filter 2", style: dropDownMenuStyle),
                    value: 1,
                  )
                ],
              ),
              PopupMenuButton(
                onSelected: (index) {},
                child: Row(
                  children: <Widget>[
                    Text("Size", style: dropDownTextStyle),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                  PopupMenuItem(
                    child: Text("Filter 1", style: dropDownMenuStyle),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text("Filter 2", style: dropDownMenuStyle),
                    value: 1,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Text("Filters",
                    style: TextStyle(color: Colors.black, fontSize: 18.0)),
                SizedBox(
                  width: 10.0,
                ),
                Text("T-Shirt",
                    style: TextStyle(color: Color(0xFF676767), fontSize: 18.0)),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFE7E7E7)),
                  child: Icon(
                    Icons.close,
                    size: 16,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text("Casual",
                    style: TextStyle(color: Color(0xFF676767), fontSize: 18.0)),
                SizedBox(
                  width: 5.0,
                ),
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFE7E7E7)),
                  child: Icon(
                    Icons.close,
                    size: 16,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            child: Divider(),
          ),
          Expanded(
              child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ItemCard(
                    title: "Cotton T-Shirt Slim Fit",
                    image: "assets/model.jpg",
                    price: "17",
                  ),
                  ItemCard(
                    title: "Sleeveless T-Shirt Slim",
                    image: "assets/model2.jpg",
                    price: "21",
                  ),
                  SizedBox(
                    height: 50.0,
                  )
                ],
              ),
              Positioned(
                bottom: 20.0,
                left: 15.0,
                child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(CustomIcon.home),
                          onPressed: () {
                            print("object");
                          },
                        ),
                        IconButton(
                          icon: Icon(CustomIcon.truck),
                          onPressed: () {
                            print("object");
                          },
                        ),
                        IconButton(
                          icon: Icon(CustomIcon.cart),
                          onPressed: () {
                            print("object");
                          },
                        ),
                        IconButton(
                          icon: Icon(CustomIcon.heart),
                          onPressed: () {
                            print("object");
                          },
                        ),
                      ],
                    )),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  const ItemCard({Key key, this.title, this.image, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            GestureDetector(
              child: Hero(
                tag: image,
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 200.0,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(14.0),
                      image: DecorationImage(
                          image: AssetImage(
                            image,
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetailsPage(image: image, title: title)));
              },
            ),
            Positioned(
              top: 30.0,
              right: 30.0,
              child: Container(
                width: 50.0,
                height: 30.0,
                child: Center(
                  child: Text(
                    "\$$price",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 130.0,
              child: Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              height: 40.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CustomIcon.cart,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Add to Bag",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 40,
          child: Divider(),
        ),
      ],
    );
  }
}
