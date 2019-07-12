import 'package:flutter/material.dart';
import './custom_icons.dart';
import './confirm_page.dart';

const String message =
    "On a warm day or layering under knitwear , this top is necessary piece for wardrobe";
const lightGrey = Color(0xFF787878);
const TextStyle dropDownTextStyle =
    TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400);
const TextStyle dropDownMenuStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class DetailsPage extends StatefulWidget {
  final String image;
  final String title;

  DetailsPage({Key key, this.image, this.title}) : super(key: key);

  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Details",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 1.2)),
          bottom: PreferredSize(
            preferredSize: Size(50.0, 50.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: TabBar(
                controller: controller,
                tabs: <Widget>[
                  Tab(text: "Details"),
                  Tab(text: "Comments"),
                  Tab(text: "Composition"),
                  Tab(text: "Others"),
                ],
                labelColor: Colors.black,
                indicatorColor: Colors.black,
              ),
            ),
          )),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          MainDetailsTab(
            image: widget.image,
            title: widget.title,
          ),
          OtherTabPage(
            title: "Comments",
          ),
          OtherTabPage(
            title: "Composition",
          ),
          OtherTabPage(
            title: "Others",
          ),
        ],
      ),
    );
  }
}

class MainDetailsTab extends StatefulWidget {
  final String image;
  final String title;

  MainDetailsTab({Key key, this.image, this.title}) : super(key: key);

  _MainDetailsTabState createState() => _MainDetailsTabState();
}

class _MainDetailsTabState extends State<MainDetailsTab> {
  TextEditingController textEditingController =
      TextEditingController(text: ".... .... ....");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: widget.image,
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 200.0,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(14.0),
                image: DecorationImage(
                    image: AssetImage(widget.image), fit: BoxFit.cover)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.left),
              SizedBox(height: 10.0),
              Text(
                message,
                style: TextStyle(fontSize: 16.0, color: lightGrey),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: lightGrey, width: 1.5),
                        borderRadius: BorderRadius.circular(20.0)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                    child: PopupMenuButton(
                      onSelected: (index) {},
                      child: Row(
                        children: <Widget>[
                          Text("Choose size".toUpperCase(),
                              style: dropDownTextStyle),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<int>>[
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: lightGrey, width: 1.5),
                        borderRadius: BorderRadius.circular(20.0)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                    child: PopupMenuButton(
                      onSelected: (index) {},
                      child: Row(
                        children: <Widget>[
                          Text("Choose color".toUpperCase(),
                              style: dropDownTextStyle),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<int>>[
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
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Quantity",
                          style: TextStyle(
                            color: lightGrey,
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: lightGrey, width: 1.5),
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.remove,
                              size: 20.0,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("1",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0)),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.add,
                              size: 20.0,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Promo Code",
                        style: TextStyle(color: lightGrey),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                          width: 240.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: lightGrey, width: 1.5),
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10.0),
                            ),
                            cursorColor: Colors.black,
                            enabled: false,
                            controller: textEditingController,
                            style: TextStyle(fontSize: 32.0, color: lightGrey),
                          )),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ConfirmPage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 45.0,
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            CustomIcon.cart,
                            color: Colors.white,
                          ),
                          Text(
                            "Add to Bag",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 45.0,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: lightGrey, width: 1.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Go to Confirmation",
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class OtherTabPage extends StatelessWidget {
  final String title;
  const OtherTabPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(title),
      ),
    );
  }
}
