import 'package:flutter/material.dart';

const linearColor = LinearGradient(
    colors: [Color(0xFFC60447), Color(0xFFA40053)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

const protectionMsgs = [
  "3 year protection plan for custom PC Build with super fast services",
  "2 year protection plan for Alienware Monitors with cheap fixings"
];

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping cart',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              WhiteText(
                text: "Shopping Cart",
                size: 24.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              CartItems(
                price: "3,499.99",
                itemName: "PC - Custom Build",
              ),
              SizedBox(
                height: 20.0,
              ),
              CartItems(
                price: "3,499.99",
                itemName: "PC - Custom Build",
              ),
              SizedBox(
                height: 30.0,
              ),
              WhiteText(
                text: "Protection Plans",
                size: 24.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              ProtectionSection(),
              SizedBox(
                height: 40.0,
              ),
              BottomPart(),
            ],
          ),
        ));
  }
}

class WhiteText extends StatelessWidget {
  final String text;
  final double size;

  const WhiteText({Key key, this.text, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.white, fontSize: size));
  }
}

class CartItems extends StatelessWidget {
  final String price;
  final String itemName;

  const CartItems({Key key, this.price, this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100.0,
          height: 80.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Color(0xFF1E1D1E),
              borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: Image(
              image: AssetImage("assets/customPC.png"),
            ),
          ),
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            WhiteText(
              text: "\$$price",
              size: 18,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              itemName,
              style: TextStyle(
                color: Color(0xFF5F5E60),
                fontSize: 18,
              ),
              textAlign: TextAlign.right,
            )
          ],
        ),
        Spacer(),
        Icon(
          Icons.more_vert,
          color: Color(0xFF5F5E60),
        )
      ],
    );
  }
}

class ProtectionSection extends StatelessWidget {
  const ProtectionSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          PlanCard(),
          PlanCardGrey(),
          PlanCardGrey(),
        ],
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  const PlanCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.all(12.0),
      width: 140.0,
      decoration: BoxDecoration(
          gradient: linearColor, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              protectionMsgs[0],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
          ),
          Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "\$99.99",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 16.0),
                textAlign: TextAlign.left,
              )),
        ],
      ),
    );
  }
}

class PlanCardGrey extends StatelessWidget {
  const PlanCardGrey({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.all(12.0),
      width: 140.0,
      decoration: BoxDecoration(
          color: Color(0xFF1E1D1E), borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              protectionMsgs[1],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
            ),
          ),
          Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: Text("Add".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 16.0))),
        ],
      ),
    );
  }
}

class LinearButton extends StatelessWidget {
  const LinearButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 40.0,
      decoration: BoxDecoration(
          gradient: linearColor, borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: WhiteText(text: "Next"),
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Estimated Total",
              style: TextStyle(
                color: Color(0xFF5F5E60),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            WhiteText(
              text: "\$4,027.97",
              size: 22.0,
            )
          ],
        ),
        LinearButton()
      ],
    );
  }
}
