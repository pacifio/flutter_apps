import 'package:flutter/material.dart';

const lightGrey = Color(0xFF787878);
const lighterGrey = Color(0xFFE7E7E7);
const TextStyle dropDownTextStyle =
    TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400);
const TextStyle dropDownMenuStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class ConfirmPage extends StatefulWidget {
  ConfirmPage({Key key}) : super(key: key);

  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Confirmation",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 1.2)),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShoppingBag(),
              SizedBox(height: 10.0),
              Divider(),
              SizedBox(height: 10.0),
              PaymentInfo(),
              SizedBox(height: 10.0),
              Divider(),
              SizedBox(height: 10.0),
              PriceSection()
            ],
          ),
        ));
  }
}

class ShoppingBag extends StatelessWidget {
  const ShoppingBag({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Shopping Bag",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w600)),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Sleeveless T-Shirt Slim", style: TextStyle(fontSize: 18.0)),
            Container(
              child: Row(
                children: <Widget>[
                  Text("\$17", style: TextStyle(fontSize: 18.0)),
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
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Cotton T-Shirt Slim Fit", style: TextStyle(fontSize: 18.0)),
            Container(
              child: Row(
                children: <Widget>[
                  Text("\$17", style: TextStyle(fontSize: 18.0)),
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
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Credit Card",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w600)),
        SizedBox(
          height: 10.0,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            "Cardholder Name",
            style: TextStyle(color: lightGrey),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 35.0,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: lighterGrey, width: 1.5),
                  borderRadius: BorderRadius.circular(20.0)),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                    hintText: "Adib Mohsin",
                    hintStyle: TextStyle(color: Colors.black)),
                cursorColor: Colors.black,
              )),
        ]),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Card Number",
                    style: TextStyle(color: lightGrey),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: 35.0,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: lighterGrey, width: 1.5),
                          borderRadius: BorderRadius.circular(20.0)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 0.0),
                            hintText: "2191 1232 1232 1232",
                            hintStyle: TextStyle(color: Colors.black)),
                        cursorColor: Colors.black,
                      )),
                ]),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Exp Date",
                    style: TextStyle(color: lightGrey),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 35.0,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: lighterGrey, width: 1.5),
                          borderRadius: BorderRadius.circular(20.0)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 0.0),
                            hintText: "03/24",
                            hintStyle: TextStyle(color: Colors.black)),
                        cursorColor: Colors.black,
                      )),
                ]),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "CCV",
                    style: TextStyle(color: lightGrey),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 35.0,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: lighterGrey, width: 1.5),
                          borderRadius: BorderRadius.circular(20.0)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 0.0),
                            hintText: "010",
                            hintStyle: TextStyle(color: Colors.black)),
                        cursorColor: Colors.black,
                      )),
                ]),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Exp Date",
                    style: TextStyle(color: lightGrey),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: lighterGrey, width: 1.5),
                        borderRadius: BorderRadius.circular(20.0)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    child: PopupMenuButton(
                      onSelected: (index) {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("BD".toUpperCase(), style: dropDownTextStyle),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<int>>[
                        PopupMenuItem(
                          child: Text("USA", style: dropDownMenuStyle),
                          value: 0,
                        ),
                        PopupMenuItem(
                          child: Text("UK", style: dropDownMenuStyle),
                          value: 1,
                        )
                      ],
                    ),
                  ),
                ]),
          ],
        )
      ],
    );
  }
}

class PriceSection extends StatelessWidget {
  const PriceSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Payment Information",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w600)),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Subtotal", style: TextStyle(fontSize: 18.0)),
            Text("\$38", style: TextStyle(fontSize: 18.0)),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Delivery", style: TextStyle(fontSize: 18.0)),
            Text("\$4", style: TextStyle(fontSize: 18.0)),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Total",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
            Text("\$4",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ConfirmPage()));
          },
          child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 45.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Center(
                child: Text(
                  "Add to Bag",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }
}
